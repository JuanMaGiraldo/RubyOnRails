class ApplicationController < ActionController::Base
  before_action :require_login

  include ApplicationHelper

<<<<<<< HEAD
=======
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return nil unless logged_in?

    @current_user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    return if logged_in?

    redirect_to login_path, notice: 'You must be logged in to access this section'
  end
>>>>>>> Adding rubocop and fixing warmings
end
