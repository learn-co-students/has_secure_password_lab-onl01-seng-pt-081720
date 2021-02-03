class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.create(user_params)

        if @user && @user.authenticate(params[:user][:password]) && params[:user][:password]==params[:user][:password_confirmation]
            session[:user_id] = @user.id
        else
            redirect_to '/users'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end