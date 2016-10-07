class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # make these methos visible do our views
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # true if have current user
    !!current_user
  end

  def require_user
    if !logger_in?
      flash[:danger] = "you must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
