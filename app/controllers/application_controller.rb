class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :is_current_user?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if !!session[:user_id]
      flash[:error] = "You don't have access to this page"
      redirect_to root_path
    end
  end

  def require_authenticated_user(user)
    unless is_current_user?(user)
      flash[:error] = "You don't have access to this page"
      redirect_to root_path
    end
  end

  def is_current_user?(user)
    user && session[:user_id] == user_id
  end
end
