class TypeSpecificationsController < ApplicationController
  before_action :set_type_specification, only: %i[ show update destroy ]

  # GET /type_specifications
  def index
    @type_specifications = TypeSpecification.all

    render json: @type_specifications
  end

  # GET /type_specifications/1
  def show
    render json: @type_specification
  end

  # POST /type_specifications
  def create
    @type_specification = TypeSpecification.new(type_specification_params)

    if @type_specification.save
      render json: @type_specification, status: :created, location: @type_specification
    else
      render json: @type_specification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_specifications/1
  def update
    if @type_specification.update(type_specification_params)
      render json: @type_specification
    else
      render json: @type_specification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_specifications/1
  def destroy
    @type_specification.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_specification
      @type_specification = TypeSpecification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_specification_params
      params.fetch(:type_specification, {})
    end
end
