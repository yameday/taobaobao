class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def update
    if @user.update(user_params)
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar, :role)
  end

end
