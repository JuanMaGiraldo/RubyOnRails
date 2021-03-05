class UsersController < ApplicationController
  skip_before_action :require_login

<<<<<<< HEAD
  def view
=======
  def list_inputs
    [{ value: 'username', type: InputsHelper::INPUT_TEXT },
     { value: 'email', type: InputsHelper::INPUT_TEXT },
     { value: 'password', type: InputsHelper::INPUT_PASSWORD },
     { value: 'password_confirmation', type: InputsHelper::INPUT_PASSWORD }]
  end

  helper_method :list_inputs

  def index
>>>>>>> Adding rubocop and fixing warmings
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
end
