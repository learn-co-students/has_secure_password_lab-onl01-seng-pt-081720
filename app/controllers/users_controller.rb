class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if not_proper_entry
            flash[:message] = "Must Enter Name and Password"
            redirect_to new_user_path
        elsif passwords_not_matching
            flash[:message] = "Passwords must match"
            redirect_to new_user_path
        elsif username_taken
            flash[:message] = "Username already exists"
            redirect_to new_user_path
        else
            user = User.new(user_params)
            if user.save
                session[:user_id] = user.id
                redirect_to "/"
            else
                redirect_to new_user_path
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def not_proper_entry
        params[:user][:name].blank? || params[:user][:password].blank?
    end

    def passwords_not_matching
        params[:user][:password] != params[:user][:password_confirmation]
    end

    def username_taken
        !!User.find_by(name: params[:user][:name])
    end
end
