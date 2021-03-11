class UsersController < ApplicationController
  skip_before_action :require_login
  helper_method %i[current_user_profile?]

  def view
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'articles', action: 'index'
    else
      render :new
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    render :view
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    render :view
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def current_user_profile?
    helpers.current_user.id == params[:id].to_i
  end
end
