require 'spec_helper'

describe SessionsController do

  describe 'logging in' do
    it 'should check the database for existing email' do
      @user = double('User')
      User.should_receive(:find_by_email).with('email@address.com').and_return(@user)
      @user.stub(:authenticate)
      post :create, {:session => {:email => 'email@address.com'}}
    end
    it 'should authenticate by email and password' do
      @user = double('User')
      User.should_receive(:find_by_email).with('email@address.com').and_return(@user)
      @user.should_receive(:authenticate).with('passwordFake').and_return(true)
      @user.stub(:session_token)
      post :create, {:session => {:email => 'email@address.com', :password=>'passwordFake'}}
      
    end
   end # NHP
    describe 'correct name/password combination' do
      it 'should assign session token' do
        @user = double('User')
        User.should_receive(:find_by_email).with('email@address.com').and_return(@user)
        @user.should_receive(:authenticate).with('passwordFake').and_return(true)
        @user.should_receive(:session_token).and_return('token')
        #assigns[session[:session_token]].should == 'token'
        post :create, {:session => {:email => 'email@address.com', :password=>'passwordFake', :session_token=>'token'}}
      
      end
      it 'should redirect to streams' do
        
        @user = double('User')
        User.should_receive(:find_by_email).with('email@address.com').and_return(@user)
        @user.should_receive(:authenticate).with('passwordFake').and_return(true)
        @user.stub(:session_token)
        #response.should == 302
        #NHP
<<<<<<< HEAD

=======
>>>>>>> b401e8222031a8d2dfa3e3b13e3c586172619164
        #response.body.should include "/streams"
      #flash.now[:warning].should == 'asdasd'
        post :create, {:session => {:email => 'email@address.com', :password=>'passwordFake'}}
      end
    end
    describe 'incorrect name/password combination' do

      it 'should show flash message' do
        
        @user = double('User')
        User.should_receive(:find_by_email).with('email@address.com').and_return(@user)
        @user.should_receive(:authenticate).with('wrongPass').and_return(false)
        #response.should render_template ('new')
        response.should_contain(flash[:warning].should == 'Invalid email/password combination')
        post :create, {:session => {:email => 'email@address.com', :password=>'wrongPass'}}
      end
      it 'should re-render new template on failure' do
        @user = double('User')
        User.should_receive(:find_by_email).with('email@address.com').and_return(@user)
        @user.should_receive(:authenticate).with('wrongPass').and_return(false)
        response.should render_template :new
        post :create, {:session => {:email => 'email@address.com', :password=>'wrongPass'}}
      end
    end
    describe 'session destroy invoked' do
      it 'session token should be cleared' do
        assigns[session[:session_token]].should == nil
        delete :destroy
      end
      it 'current user should be set to nil' do 
        assigns[@current_user].should == nil
        delete :destroy
      end
<<<<<<< HEAD
      it 'display flash message indusericating logout' do
        assigns[flash[:notice]].should == 'You have logged out'
        delete :destroy
      end

    end
    describe 'twitter session began' do
      it 'should assign something to auth when callback is invoked' do
       
        controller.request.env["omniauth.auth"] = "HI"

        assigns[@auth].should_not == nil

         
        get :twitter_create
      end
      it 'should redirect to streams on success' do
        response.should redirect_to '/streams'
        get :twitter_create
      end
    end
  end
   describe 'twitter session destroyed' do
      it 'session screen name should be set to nil' do
         assigns[session[:screen_name]].should == nil
         get :twitter_destroy
      end
      it 'should redirect to login' do
        response.should redirect_to '/login'
        get :twitter_destroy
      end
      
    end
=======
      it 'display flash message indicating logout' do
        assigns[flash[:notice]].should == 'You have logged out'
        delete :destroy
      end
    end
  end
>>>>>>> b401e8222031a8d2dfa3e3b13e3c586172619164
end
