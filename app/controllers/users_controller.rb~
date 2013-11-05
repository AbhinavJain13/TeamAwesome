class UsersController < ApplicationController

  before_filter :set_current_user, :only=>['show','edit','update','delete'] 
 
  def create

    @user_params = params[:user]
    if (@user_params[:name] == '' || @user_params[:password] == '' || @user_params[:password_confirmation] == '' || @user_params[:email] == '')
       flash[:notice] = 'Please fill out each field of the form.'    
    else
       @user = User.new(params[:user])
       if @user.save
         flash[:notice] = 'Welcome!'
         redirect_to streams_path 
       else
         flash[:notice] = 'There was an error creating your account.'
       end
       
    end
  end
end
