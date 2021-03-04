class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :require_login

  def getList
    [{ value: "email",type: InputsHelper::INPUT_TEXT},{ value: "password",type: InputsHelper::INPUT_PASSWORD}]
  end

  helper_method :getList

  def login
    @user = User.new
    session[:user_id] = nil
  end

  def logout
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      redirect_to login_path
    end
  end
end
