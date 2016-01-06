class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created"
      redirect_to user_path(@user)
    else
# if user doesn't save....re-render new with flash for invalid login
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
