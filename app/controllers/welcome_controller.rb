class WelcomeController < ApplicationController
  def homepage
    @user = User.find(session[:user_id])
  end
end
