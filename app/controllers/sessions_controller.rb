class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #sign in and redirect to show page
      session[:session_token]=user.session_token
      @current_user = user
      redirect_to streams
    else
      flash.now[:warning] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:session_token]=nil
    @current_user = nil
    flash[:notice]='Goodbye!'
    redirect_to users_path
  end

end

