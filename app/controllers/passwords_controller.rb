# app/controllers/passwords_controller.rb
class PasswordsController < ApplicationController
	before_action :authenticate_user!

	def update
		if current_user.update_with_password(password_params)
			bypass_sign_in(current_user)
			render json: { message: 'Password updated successfully.' }, status: :ok
		else
			render json: current_user.errors, status: :unprocessable_entity
		end
	end

	private

	def password_params
		params.require(:user).permit(:password, :password_confirmation, :current_password)
	end
end
  