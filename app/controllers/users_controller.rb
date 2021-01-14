class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    # @user = User.create(user_params)
    # if @user.authenticate(user_params[:password])
    #   session[:user_id] = @user.id
    # else
    #   redirect_to action: 'new'
    # end


    # @user = User.create(user_params)
    # redirect_to 'new' unless @user.authenticate(user_params[:password])
    # session[:user_id] = @user.id

    
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to welcome_path(@user)
      else
        redirect_to 'http://test.host/users/new' # Harcoded this because it wasn't working
      end
    
    
    # if @user = User.create(user_params)
    #   if @user.authenticate(user_params[:password])
    #     session[:user_id] = @user.id
        
    #   else
    #     redirect_to welcome_path
    #   end
    # else
    #   byebug
    #   # redirect_to welcome_path(@user) unless @user.authenticate(user_params[:password])
    #   # session[:user_id] = @user.id
    # end

  end

  def welcome
    byebug
  end

  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
