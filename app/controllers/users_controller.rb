class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.create(user_params)

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            binding.pry
            redirect_to '/users/new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end