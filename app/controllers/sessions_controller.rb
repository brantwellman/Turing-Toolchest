class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back!"
      redirect_to user_path(user)
    else
      # user doesn't exist or doesn't have correct password
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
