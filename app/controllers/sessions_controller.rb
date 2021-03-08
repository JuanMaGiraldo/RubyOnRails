class SessionsController < ApplicationController
  skip_before_action :require_login

  def login
    @user = User.new
    logout
  end

  def logout
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(email: params[:email])
    if !@user.nil? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      redirect_to login_path, alert: 'Wrong email or password!'
    end
  end

end
