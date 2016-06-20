class UserMailer < ApplicationMailer

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
end
