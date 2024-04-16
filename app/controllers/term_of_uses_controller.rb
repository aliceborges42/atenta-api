class TermOfUsesController < ApplicationController
  before_action :set_term_of_use, only: %i[ show update destroy ]

  # GET /term_of_uses
  def index
    @term_of_uses = TermOfUse.all

    render json: @term_of_uses
  end

  # GET /term_of_uses/1
  def show
    render json: @term_of_use
  end
  # def show
  #   term_of_use = TermOfUse.last
  #   render json: { content: term_of_use.content }
  # end

  # POST /term_of_uses
  def create
    @term_of_use = TermOfUse.new(term_of_use_params)

    if @term_of_use.save
      render json: @term_of_use, status: :created, location: @term_of_use
    else
      render json: @term_of_use.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /term_of_uses/1
  def update
    if @term_of_use.update(term_of_use_params)
      render json: @term_of_use
    else
      render json: @term_of_use.errors, status: :unprocessable_entity
    end
  end

  # DELETE /term_of_uses/1
  def destroy
    @term_of_use.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term_of_use
      @term_of_use = TermOfUse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def term_of_use_params
      params.require(:term_of_use).permit(:content)
    end
end
