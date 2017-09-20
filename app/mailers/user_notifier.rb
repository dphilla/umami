class UserNotifier < ApplicationMailer
  default from: 'team@umami-salt.com'

  def send_signup_email(user)
    @user = user
    mail( to: @user.email,
    subject: "Thanks for joining Umami!")
  end
end
