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

  def edit_password
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:current_password].blank?
      if @user.update user_params
        redirect_to root_path, notice: "Profile Updated"
      else 
        render :edit, alert: "Unable to update profile. Try Again!"
      end
    elsif !params[:user][:current_password].blank?
      # if the current password is not the same as in db
      if @user&.authenticate(params[:user][:current_password]) == false
        @user.errors.add(:current_password, "is doesn't match")
        return render :edit_password
      end

      # if new password is the same as the current password
      if params[:user][:password] == params[:user][:current_password]
        @user.errors.add(:new_password, "shouldn't be the same as your old password")
        return render :edit_password
      end

      if @user.update user_params
        redirect_to root_path, notice: "Password Changed!"
      else 
        render :edit_password, alert: "Unable to change password. Try Again!"
      end
    end
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
