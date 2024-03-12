class SecurityButtonsController < ApplicationController
  before_action :set_security_button, only: %i[ show update destroy ]

  # GET /security_buttons
  def index
    @security_buttons = SecurityButton.all

    render json: @security_buttons
  end

  # GET /security_buttons/1
  def show
    render json: @security_button
  end

  # POST /security_buttons
  def create
    @security_button = SecurityButton.new(security_button_params)

    if @security_button.save
      render json: @security_button, status: :created, location: @security_button
    else
      render json: @security_button.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /security_buttons/1
  def update
    if @security_button.update(security_button_params)
      render json: @security_button
    else
      render json: @security_button.errors, status: :unprocessable_entity
    end
  end

  # DELETE /security_buttons/1
  def destroy
    @security_button.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_security_button
      @security_button = SecurityButton.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def security_button_params
      params.require(:security_button).permit(:latitude, :longitude)
    end
end
