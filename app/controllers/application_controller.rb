class ApplicationController < ActionController::Base
  protect_from_forgery
  protected

  class SessionError < RuntimeError; end

  def set_current_user
    @current_user ||= User.find_by_email(session[:email])
   
    redirect_to login_path unless @current_user
  end

end
