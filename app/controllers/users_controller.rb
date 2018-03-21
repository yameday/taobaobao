class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def edit
    unless current_user == @user
      flash[:danger] = "Not allow!"
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path
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
