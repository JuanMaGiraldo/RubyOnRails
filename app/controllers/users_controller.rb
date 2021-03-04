class UsersController < ApplicationController
  skip_before_action :require_login

  def getList
    [{ value: "username",type: InputsHelper::INPUT_TEXT},{ value: "email",type: InputsHelper::INPUT_TEXT},
      { value: "password",type: InputsHelper::INPUT_PASSWORD},{ value: "password_confirmation",type: InputsHelper::INPUT_PASSWORD}]
  end

  helper_method :getList

  def index
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to :controller => 'articles', :action => 'index'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
