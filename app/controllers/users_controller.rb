class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to welcome_path(@user)
    else
      redirect_to '/users/new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
