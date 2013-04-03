class ApplicationController < ActionController::Base
  protect_from_forgery

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate!
    redirect_to new_session_path if current_user.blank?
  end

  def sign_out
    session[:user_id] = nil
  end

  helper_method :current_user
end
