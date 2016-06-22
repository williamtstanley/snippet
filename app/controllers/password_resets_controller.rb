class PasswordResetsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user
      token = SecureRandom.urlsafe_base64
      user.reset_token = token

    else
      render :new
    end
  end

end
