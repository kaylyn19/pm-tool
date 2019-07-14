class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path
    else
      render :new, alert: "Sign In Failed. Try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully signed out"
  end
end
