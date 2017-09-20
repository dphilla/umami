require_relative 'application'
ActionMailer::Base.smtp_settings = {
  :user_name => "aram.j.anderson",
  :password => "C10g10ves0l0!",
  :domain => 'https://umami-salt.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
# Initialize the Rails application.
Rails.application.initialize!
