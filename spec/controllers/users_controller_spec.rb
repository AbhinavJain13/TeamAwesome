require 'spec_helper'

describe UsersController do

  describe 'create new user' do
    before :each do
      @user = double()
      User.should_receive(:new).with('test').and_return(@user)
    end
    it 'should call the User model to make a new user' do
      @user.stub(:save)
      post :create, {:user => 'test'}
    end
    describe 'if save succeeds' do
      before :each do 
        @user.stub(:save).and_return(true) 
        @user.stub(:session_token).and_return('123')
        @user.stub(:email).and_return('example@email.com')
        post :create, {:user => 'test'}
      end
      it 'should set session variables' do
        session[:session_token].should == '123'
        session[:email].should == 'example@email.com'
      end
      it 'should show flash message' do 
        flash[:notice].should == 'Welcome!'
      end
      it 'should redirect to twitter authorization page' do
        response.should redirect_to('/auth/twitter')
      end
    end
    it 'should render new if save fails' do
      @user.stub(:save).and_return(nil)
      post :create, {:user => 'test'}
      response.should render_template('users/new')
    end
  end

end
