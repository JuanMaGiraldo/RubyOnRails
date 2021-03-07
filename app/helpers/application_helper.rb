module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return User.new(name: "Annonymous....") unless logged_in?

    @current_user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    unless logged_in?
      redirect_to login_path, notice: "You must be logged in to access this section"
    end
  end

  def user_follows_blogger?(user)
    current_user.follows_blogger?(user)
  end
end
