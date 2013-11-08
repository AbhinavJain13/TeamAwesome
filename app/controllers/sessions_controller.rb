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
      redirect_to streams_path
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

end

