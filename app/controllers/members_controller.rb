class MembersController < ApplicationController
	before_action :authenticate_user!
	# def index
	# 	render json: current_user, status: :ok
	# end
	def index
		user_data = current_user.attributes
    user_data["avatar_url"] = url_for(current_user.avatar) if current_user.avatar.attached?
    render json: user_data, status: :ok
  end

	def update
		@user = current_user
		
		if @user.update(user_params)
			render json: @user, status: :ok
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end
	
	private
	def user_params
		params.require(:user).permit(:name, :email, :cpf, :avatar)
	end
end