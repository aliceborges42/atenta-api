class LikesController < ApplicationController
  before_action :set_like, only: %i[ show update destroy ]
  before_action :authenticate_user!, except: %i[ show index ]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    complaint_id = params[:like][:complaint_id]
    
    # Verifique se a Complaint com o complaint_id fornecido existe
    unless Complaint.exists?(complaint_id)
      render json: { error: "Complaint with id #{complaint_id} does not exist" }, status: :unprocessable_entity
      return
    end
    
    existing_deslike = Deslike.find_by(user_id: current_user.id, complaint_id: complaint_id)
    existing_deslike.destroy if existing_deslike
    
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.complaint_id = complaint_id
    
    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:complaint_id)
    end
end
