class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_path, alert: "welcome!"
    else
      render :new, alert: "Error! Try Again."
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update params.require(:user).permit(:first_name, :last_name)
      redirect_to root_path, notice: "Profile Updated"
    else
      render :edit
    end
  end

  # def edit_password
  #   @user = current_user
  # end

  # def update_password
  #   @user = current_user
  #   if @user.update params.require(:user).permit(:password, :password_confirmation)
  #     redirect_to root_path, notice: "Password Updated"
  #   else
  #     render :edit
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
