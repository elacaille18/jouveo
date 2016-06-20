class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    password = "123456"
    UserMailer.welcome(user, password)
  end
end
