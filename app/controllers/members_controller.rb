class MembersController < ApplicationController
    before_action :authenticate_user!
    def index
        render json: current_user, status: :ok
    end

    # def update
    #     if @complaint.update(complaint_params)
    #         render json: @complaint
    #     else
    #         render json: @complaint.errors, status: :unprocessable_entity
    #     end
    # end
end