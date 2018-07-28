class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :login_checkpoint

  def current_user
    @current_user ||= User.find_by_id(session[:user]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def login_checkpoint
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end
end
