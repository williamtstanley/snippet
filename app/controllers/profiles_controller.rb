class ProfilesController < ApplicationController

  def edit
    @user = User.find params[:user_id]
    @profile = Profile.find params[:id]
  end

  def update
    user = User.find params[:user_id]
    profile = Profile.find params[:id]
    if profile.update profile_params
      redirect_to user_path(user), notice: "Profile Updated"
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:about, :twitter, :github, :linkedin)
    end
end
