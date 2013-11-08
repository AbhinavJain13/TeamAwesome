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
  end
end
