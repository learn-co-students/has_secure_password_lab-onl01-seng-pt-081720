class WelcomeController < ApplicationController
    before_action :user_logged_in?

    def home
        @user = User.find_by_id(session[:user_id]) 
    end

    private

    def user_logged_in?
        if session[:user_id].blank?
            flash[:message] = "You must log in to continue"
            redirect_to login_path
        end
    end
end
