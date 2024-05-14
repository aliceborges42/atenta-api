class ComplaintsController < ApplicationController
  before_action :authenticate_user!, except: %i[ show index common_incidents_in_area resolution_rate number_of_complaints_by_month resolved_complaints_by_month]
  before_action :set_complaint, only: %i[ show update destroy ]

  # GET /complaints
  def index
    # @complaints = Complaint.all.includes(:type_specification, :complaint_type) # Isso irá pré-carregar os TypeSpecifications para evitar N+1 queries
  
    # render json: @complaints.as_json(include: { type_specification: { only: [:id, :specification] }, complaint_type: { only: [:id, :classification]} })
    @q = Complaint.ransack(params[:q])
    @complaints = @q.result.includes(:type_specification, :complaint_type)

    render json: @complaints.as_json(include: { type_specification: { only: [:id, :specification] }, complaint_type: { only: [:id, :classification]} })
  end

  # GET /complaints/search
  # def search
  #   @q = Complaint.ransack(params[:q])
  #   @complaints = @q.result.includes(:type_specification, :complaint_type)

  #   render json: @complaints.as_json(include: { type_specification: { only: [:id, :specification] }, complaint_type: { only: [:id, :classification]} })
  # end

  # GET /complaints/1
  def show
    images_data = @complaint.images.map { |image| { id: image.id, url: url_for(image) } }
    
    render json: @complaint.as_json(include: {
      complaint_type: { only: [:id, :classification] },
      type_specification: { only: [:id, :specification] }
    }).merge(images: images_data)
  end

  # POST /complaints
  def create
    @complaint = Complaint.new(complaint_params.except(:images))
    @complaint.user_id = current_user.id
    # @complaint.type_specification = TypeSpecification.find(params[:complaint][:type_specification_id])
    # @complaint.complaint_type = ComplaintType.find(params[:complaint][:complaint_type_id])
    
    type_specification = TypeSpecification.find_by(specification: params[:complaint][:type_specification_id])
    complaint_type = ComplaintType.find_by(classification: params[:complaint][:complaint_type_id])

    if type_specification.nil?
      render json: { error: "Type Specification not found" }
      return
    end
    if complaint_type.nil?
      render json: { error: "Complaint Type not found" }
      return
    end

    @complaint.type_specification = type_specification
    @complaint.complaint_type = complaint_type
    # complaint_type = TypeSpecification.find_by(specification: "Assédio Sexual")

    # print("TYPE SPECIFICATIONNNNNNNN")

    
    print(current_user)

    images = params[:complaint][:images]

    if images
      images.each do |image|
        @complaint.images.attach(image)
      end
    end
    
    if @complaint.save

      render json: @complaint, status: :created, location: @complaint
    else
      render json: @complaint.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /complaints/1
  # def update
  #   if @complaint.update(complaint_params)
  #     render json: @complaint
  #   else
  #     render json: @complaint.errors, status: :unprocessable_entity
  #   end
  # end
  def update
    if @complaint.user_id == current_user.id
      old_status = @complaint.status
      if @complaint.update(complaint_params.except(:images, :removed_images_ids))
        # Verifica se o status foi alterado para "Resolvido" e se o resolution_date ainda não foi definido
        if old_status != "Resolvido" && @complaint.status == "Resolvido" && @complaint.resolution_date.nil?
          @complaint.update(resolution_date: Date.today)
          print("entrouiiii")
        end
  
        # Processa as imagens
        images = params[:complaint][:images]
        removed_images_ids = params[:complaint][:removed_images_ids]
  
        if images
          # Adiciona novas imagens à reclamação
          images.each do |image|
            @complaint.images.attach(image)
          end
        end
  
        if removed_images_ids
          # Remove imagens da reclamação
          removed_images_ids.each do |image_id|
            image = @complaint.images.find_by(id: image_id)
            image.purge if image
          end
        end
  
        render json: @complaint
      else
        render json: @complaint.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized: You do not have permission to update this complaint' }, status: :unauthorized
    end
  end
  
  
  def member_complaints
    # Filtra as reclamações pelo user_id do usuário logado
    @complaints = Complaint.where(user_id: current_user.id).includes(:type_specification, :complaint_type)

    render json: @complaints.as_json(include: { type_specification: { only: [:id, :specification] }, complaint_type: { only: [:id, :classification]} })
  end

  # DELETE /complaints/1
  def destroy
    @complaint.destroy!
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer)
  end
  
  # GET /complaints/common_incidents_in_area
  def common_incidents_in_area
    radius = 200 # Definindo o raio como 600 metros
    type_specification_id = params[:type_specification_id] # Recebendo o parâmetro type_specification_id
    complaints = Complaint.all

    # Inicializando um conjunto para armazenar os grupos de denúncias com o mesmo tipo de especificação
    common_groups = Set.new

    # Percorrendo todas as denúncias
    complaints.each_with_index do |complaint, index|
      # Verificando se esta denúncia já foi incluída em algum grupo existente
      next if common_groups.any? { |group| group.include?(complaint) }

      # Consultando denúncias do mesmo tipo de especificação e próximas
      nearby_complaints = Complaint.where("ST_DWithin(ST_MakePoint(?, ?)::geography, ST_MakePoint(complaints.longitude, complaints.latitude)::geography, ?) AND type_specification_id = ?", complaint.longitude, complaint.latitude, radius, type_specification_id)
    
      # Verificando se há mais de uma denúncia no grupo
      if nearby_complaints.length > 1
        # Adicionando ao conjunto se houver mais de uma denúncia
        common_groups << nearby_complaints
      end
    end

    render json: common_groups.as_json
  end

  def number_of_complaints_by_month
    # Filtragem por ano, complaint type e type specification
    year = params[:year] if params[:year].present?
    complaint_type_id = params[:complaint_type_id] if params[:complaint_type_id].present?
    type_specification_id = params[:type_specification_id] if params[:type_specification_id].present?

    # Filtros opcionais
    complaints = Complaint.all
    complaints = complaints.where(date: Date.parse("#{year}-01-01")..Date.parse("#{year}-12-31")) if year.present?
    complaints = complaints.where(complaint_type_id: complaint_type_id) if complaint_type_id.present?
    complaints = complaints.where(type_specification_id: type_specification_id) if type_specification_id.present?

    # Contagem de denúncias por mês do ano
    complaints_by_month = complaints.group_by { |complaint| complaint.date.strftime('%Y-%m') }
                                    .transform_values(&:count)
    
    render json: complaints_by_month
  end

  # GET /complaints/resolution_rate
  def resolution_rate
    # Filtragem por ano, complaint type e type specification
    year = params[:year] if params[:year].present?
    complaint_type_id = params[:complaint_type_id] if params[:complaint_type_id].present?
    type_specification_id = params[:type_specification_id] if params[:type_specification_id].present?

    # Filtros opcionais
    complaints = Complaint.all
    complaints = complaints.where(date: Date.parse("#{year}-01-01")..Date.parse("#{year}-12-31")) if year.present?
    complaints = complaints.where(complaint_type_id: complaint_type_id) if complaint_type_id.present?
    complaints = complaints.where(type_specification_id: type_specification_id) if type_specification_id.present?

    # Taxa de resolução de denúncias
    total_complaints = complaints.count
    resolved_complaints = complaints.where(status: 'Resolvido').count
    resolution_rate = (resolved_complaints.to_f / total_complaints * 100).round(2)
    
    render json: { resolution_rate: resolution_rate }
  end

  def resolved_complaints_by_month
    # Filtragem por ano, complaint type e type specification
    year = params[:year] if params[:year].present?
    complaint_type_id = params[:complaint_type_id] if params[:complaint_type_id].present?
    type_specification_id = params[:type_specification_id] if params[:type_specification_id].present?
  
    # Filtros opcionais
    complaints = Complaint.all
    complaints = complaints.where(resolution_date: Date.parse("#{year}-01-01")..Date.parse("#{year}-12-31")) if year.present?
    complaints = complaints.where(complaint_type_id: complaint_type_id) if complaint_type_id.present?
    complaints = complaints.where(type_specification_id: type_specification_id) if type_specification_id.present?
  
    # Contagem de denúncias resolvidas por mês do ano
    resolved_complaints_by_month = complaints.where(status: 'Resolvido')
                                             .group_by { |complaint| complaint.resolution_date.strftime('%Y-%m') }
                                             .transform_values(&:count)
  
    render json: resolved_complaints_by_month
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:id, :description, :status, :latitude, :longitude, :hour, :date, :complaint_type_id, :type_specification_id, images: [],  removed_images_ids: [],)
    end
end
