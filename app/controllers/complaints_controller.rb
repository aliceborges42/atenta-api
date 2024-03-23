class ComplaintsController < ApplicationController
  before_action :authenticate_user!, except: %i[ show index ]
  before_action :set_complaint, only: %i[ show update destroy ]

  # GET /complaints
  def index
    @complaints = Complaint.all.includes(:type_specification, :complaint_type) # Isso irá pré-carregar os TypeSpecifications para evitar N+1 queries
  
    render json: @complaints.as_json(include: { type_specification: { only: [:id, :specification] }, complaint_type: { only: [:id, :classification]} })
  end

  # GET /complaints/1
  def show
    images_urls = @complaint.images.map do |image|
      url_for(image)
    end
    render json: @complaint.as_json(include: {
      complaint_type: { only: [:id, :classification]},
      type_specification: { only: [:id, :specification] }
    }).merge(images: images_urls)
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
  def update
    if @complaint.update(complaint_params)
      render json: @complaint
    else
      render json: @complaint.errors, status: :unprocessable_entity
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:id, :description, :status, :latitude, :longitude, :hour, :date, :complaint_type_id, :type_specification_id, images: [])
    end
end
