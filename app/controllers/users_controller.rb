class UsersController < ApplicationController

  before_filter :set_current_user, :only=>['show','edit','update','delete'] 
 
  def new
    #default - render 'new' template
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Welcome!'
      session[:session_token]=@user.session_token
      redirect_to '/auth/twitter'
    else
      render 'new'
    end
  end
end
