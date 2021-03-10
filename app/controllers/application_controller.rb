class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def require_login
    unless logged_in?
      redirect_to login_path, notice: "You must be logged in to access this section"
    end
  end
end
