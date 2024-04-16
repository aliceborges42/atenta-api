class PrivacyPoliciesController < ApplicationController
  before_action :set_privacy_policy, only: %i[ show update destroy ]

  # GET /privacy_policies
  def index
    @privacy_policies = PrivacyPolicy.all

    render json: @privacy_policies
  end

  # GET /privacy_policies/1
  def show
    render json: @privacy_policy
  end

  # def show
  #   privacy_policy = PrivacyPolicy.last
  #   render json: { content: privacy_policy.content }
  # end

  # POST /privacy_policies
  def create
    @privacy_policy = PrivacyPolicy.new(privacy_policy_params)

    if @privacy_policy.save
      render json: @privacy_policy, status: :created, location: @privacy_policy
    else
      render json: @privacy_policy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /privacy_policies/1
  def update
    if @privacy_policy.update(privacy_policy_params)
      render json: @privacy_policy
    else
      render json: @privacy_policy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /privacy_policies/1
  def destroy
    @privacy_policy.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privacy_policy
      @privacy_policy = PrivacyPolicy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def privacy_policy_params
      params.require(:privacy_policy).permit(:content)
    end
end
