class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.username, subject: 'This is the subject!')
  end
end
