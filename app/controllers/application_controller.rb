class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless helpers.logged_in?
      redirect_to login_path, notice: "You must be logged in to access this section"
    end
  end

end
