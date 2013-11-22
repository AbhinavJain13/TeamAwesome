class ApplicationController < ActionController::Base
  protect_from_forgery
  protected
  def set_current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
    redirect_to login_path unless @current_user && session[:screen_name]
  end

  def client
    #Twitter.configure do |config|
      #config.consumer_key = 'h0MgV3Rzrr9nxFthM1THA'
      #config.consumer_secret = '75Wj9bVDJrKz2Y74MFgQzi6QgHXgXFPJs7A0wPq1nU'
      #config.oauth_token = session[:oauth_token]
      #config.oauth_token_secret = session[:oauth_token_secret]
     #end
     #@client = Twitter::Client.new(oauth_token: session[:oauth_token], oauth_token_secret: session[:oauth_token_secret])
     
  end
end
