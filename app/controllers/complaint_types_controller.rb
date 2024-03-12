class ComplaintTypesController < ApplicationController
  before_action :set_complaint_type, only: %i[ show update destroy ]

  # GET /complaint_types
  def index
    @complaint_types = ComplaintType.all

    render json: @complaint_types
  end

  # GET /complaint_types/1
  def show
    render json: @complaint_type
  end

  # POST /complaint_types
  def create
    @complaint_type = ComplaintType.new(complaint_type_params)

    if @complaint_type.save
      render json: @complaint_type, status: :created, location: @complaint_type
    else
      render json: @complaint_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /complaint_types/1
  def update
    if @complaint_type.update(complaint_type_params)
      render json: @complaint_type
    else
      render json: @complaint_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /complaint_types/1
  def destroy
    @complaint_type.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint_type
      @complaint_type = ComplaintType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_type_params
      params.fetch(:complaint_type, {})
    end
end
