class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update]

  def edit
    unless current_user == @user
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "Great! The profile was updated successfully."
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
