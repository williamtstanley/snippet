class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user
      token = SecureRandom.urlsafe_base64
      user.reset_token = token
      url = edit_password_reset_url(user) + "/?token=#{token}"
      PasswordResetMail.send_reset(user, url).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

end
