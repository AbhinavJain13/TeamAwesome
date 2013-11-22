class SessionsController < ApplicationController
  skip_before_filter :set_current_user

  def new
  end

  def create
    user=User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #sign in and redirect to show page
      session[:session_token]=user.session_token
      @current_user = user
      redirect_to '/auth/twitter'
    else
      flash[:warning] = 'Invalid email/password combination'				
      render 'new'
    end
  end
  
  def destroy
    session[:session_token]=nil
    @current_user=nil
    flash[:notice]='You have logged out'
    redirect_to login_path
  end

  def twitter_create
    @auth = request.env["omniauth.auth"]
   # client = Twitter::Client.new(oauth_token: @auth["oauth_token"], oauth_token_secret: @auth["oauth_token_secret"], screen_name: @auth["info"]["nickname"])
    #client.user(@auth["info"]["nickname"])


    session[:screen_name] = @auth["info"]["nickname"]
    redirect_to streams_path

    # return client 

    #@test = session[:screen_name]
    #return @test

    #session[:oauth_token_secret] = @auth["oauth_token_secret"]
    #@current_user.twitterName = @auth["screen_name"]
    
    
    #user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])  
    #redirect_to streams_path
  end

  def twitter_destroy
    
    #@current_user = User.find_by_session_token(session[:session_token])
    #@current_user.uid = '';
    #@current_user.twitterName = '';
    session[:screen_name] = nil
    redirect_to login_path
  end



  

end

