class PasswordResetMail < ApplicationMailer

  def send_reset (user, url)
    @url = url
    mail(to: user.email, subject:"Snippet password reset")
  end
end
