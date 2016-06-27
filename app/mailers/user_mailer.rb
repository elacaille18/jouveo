class UserMailer < ApplicationMailer
  include Devise::Mailers::Helpers
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user, password)
    @user = user # instance variable available in the view
    @password = password
    mail(to: @user.email, subject:"Your login to Jouveo - Jouve & Associés" )
  end

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end

  # def reset_password_instructions(user, token, options)
  #   @resource = user
  #   mail(:to => @resource.email, :subject => "Reset password instructions", :tag => 'password-reset', :content_type => "text/html") do |format|
  #     format.html { render "devise/mailer/reset_password_instructions" }
  #   end
  # end
end
