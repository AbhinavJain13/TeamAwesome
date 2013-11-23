class ApplicationController < ActionController::Base
  protect_from_forgery
  protected

  def set_current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
    redirect_to login_path unless @current_user
  end

end
