class MembersController < ApplicationController
	before_action :authenticate_user!, except:  %i[ forgot reset ]
	# def index
	# 	render json: current_user, status: :ok
	# end
	def index
		user_data = current_user.attributes
    user_data["avatar_url"] = url_for(current_user.avatar) if current_user.avatar.attached?
    render json: user_data, status: :ok
  end

	# def update
	# 	@user = current_user
		
	# 	if @user.update(user_params)
	# 		render json: @user, status: :ok
	# 	else
	# 		render json: @user.errors, status: :unprocessable_entity
	# 	end
	# end

	def update
		@user = current_user
	
		# Verifica se a senha está presente nos parâmetros
		if params[:user][:password].present? && !@user.valid_password?(params[:user][:current_password])
			render json: { error: 'Senha atual incorreta' }, status: :unprocessable_entity
			return
		end
	
		# Verifica se um novo avatar está sendo enviado
		if params[:user][:avatar].present?
			# Exclui o avatar anterior, se existir
			@user.avatar.purge if @user.avatar.attached?
		end
	
		if @user.update(user_params)
			render json: @user, status: :ok
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end	

	def forgot
    return render json: { error: 'Email em branco' }, status: :unprocessable_entity if params[:email].blank?

    user = User.find_by(email: params[:email])

    if user.present?
      user.generate_password_token!
      UserMailer.forgot_password_email(user).deliver_now
      render json: { status: 'ok' }, status: :ok
    else
      render json: { error: ['Endereço de email não encontrado. Tente novamente.'] }, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    return render json: { error: 'Código em branco' }, status: :unprocessable_entity if token.blank?
    return render json: { error: 'Email em branco' }, status: :unprocessable_entity if email.blank?
    return render json: { error: 'Senha em branco' }, status: :unprocessable_entity if password.blank?
    return render json: { error: 'Confirmação de senha em branco' }, status: :unprocessable_entity if password_confirmation.blank?

    user = User.find_by(email: email)

    if user.present? && user.password_token_valid?(token)
      if user.reset_password!(password, password_confirmation)
        UserMailer.reset_password_email(user).deliver_now
        render json: { status: 'ok' }, status: :ok
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: ['Email ou código inválido.'] }, status: :not_found
    end
  end
	
	private
	def user_params
		params.require(:user).permit(:name, :email, :cpf, :avatar, :password)
	end
end