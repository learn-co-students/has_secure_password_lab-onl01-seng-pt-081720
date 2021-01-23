class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if not_proper_entry
            flash[:message] = "Must Enter Name and Password"
            redirect_to new_user_path
        else
            user = User.find_by(name: params[:user][:name])
            if !!user && !!user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to '/'
            else
                flash[:message] = "Invalid Username or Password"
                redirect_to login_path
            end
        end
    end

    def delete
        session.clear
        redirect_to login_path
    end

    private

    def not_proper_entry
        params[:user][:name].blank? || params[:user][:password].blank?
    end

    def passwords_not_matching
        params[:user][:password] != params[:user][:password_confirmation]
    end

end
