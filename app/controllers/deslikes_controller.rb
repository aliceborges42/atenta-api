class DeslikesController < ApplicationController
  before_action :set_deslike, only: %i[ show update destroy ]
  before_action :authenticate_user!, except: %i[ show index ]

  # GET /deslikes
  def index
    @deslikes = Deslike.all

    render json: @deslikes
  end

  # GET /deslikes/1
  def show
    render json: @deslike
  end

  # POST /deslikes
  def create
    complaint_id = params[:deslike][:complaint_id]
    
    # Verifique se a Complaint com o complaint_id fornecido existe
    unless Complaint.exists?(complaint_id)
      render json: { error: "Complaint with id #{complaint_id} does not exist" }, status: :unprocessable_entity
      return
    end
    
    existing_like = Like.find_by(user_id: current_user.id, complaint_id: complaint_id)
    existing_like.destroy if existing_like

    @deslike = Deslike.new(deslike_params)
    @deslike.user_id = current_user.id
    @deslike.complaint_id = complaint_id

    if @deslike.save
      render json: @deslike, status: :created, location: @deslike
    else
      render json: @deslike.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deslikes/1
  def update
    if @deslike.update(deslike_params)
      render json: @deslike
    else
      render json: @deslike.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deslikes/1
  def destroy
    @deslike.destroy!
  end

  def deslikes_by_complaint
    @deslikes = Deslike.where(complaint_id: params[:complaint_id])

    render json: @deslikes
  end

  def deslikes_by_user
    @deslikes = Deslike.where(user_id: current_user.id)

    render json: @deslikes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deslike
      @deslike = Deslike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deslike_params
      params.require(:deslike).permit(:complaint_id)
    end
end
