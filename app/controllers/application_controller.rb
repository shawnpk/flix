class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_user?(user)
    current_user == user
  end
  helper_method :current_user?

  def current_user_admin?
    current_user&.admin?
  end
  helper_method :current_user_admin?

  def require_admin
    redirect_to movies_path, alert: "Not authorized" unless current_user_admin?
  end

  def require_signin
    session[:intended_url] = request.fullpath

    redirect_to new_session_path, alert: "Please sign in first" unless current_user
  end
end
