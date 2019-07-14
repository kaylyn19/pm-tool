class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      redirect_to projects_path, notice: "Signed In"
    else
      render :new, alert: "Sign In Failed. Try again!"
    end
  end

  def destroy
  end
end
