# frozen_string_literal: true

# usermailer
class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: '[BEM VINDO(A) AO TINO APP]')
    end
  
    def forgot_password_email(user)
      @user = user
      mail(to: @user.email, subject: '[ALTERAR MINHA SENHA]')
    end
  
    def reset_password_email(user)
      @user = user
      mail(to: @user.email, subject: '[NOVA SENHA]')
    end
  end
  