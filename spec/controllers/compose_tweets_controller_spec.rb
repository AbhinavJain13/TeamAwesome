require 'spec_helper'

describe ComposeTweetsController do

  before :each do
   @current_user = double()
   User.stub(:find_by_session_token).and_return(@current_user)
  end

  describe 'adding compose tweet' do
    
    describe 'given valid input' do
      before :each do
        @valid_input = {:compose_tweet => {'text' => 'hello'}}
        @twitter_obj = double()
      end
      it 'should call the Twitter gem to compose a tweet' do 
        Twitter.should_receive(:update).with('hello').and_return(@twitter_obj)
        @twitter_obj.stub(:id).and_return('fake_id')
        @twitter_obj.stub(:text).and_return('fake_text')
        @current_user.stub(:name).and_return('fake_name')
        ComposeTweet.stub(:create_compose_tweet)
        post :create, @valid_input
        assigns(:tweet_text).should == 'hello'
      end
      it 'should call the model method to create a new compose tweet record' do
        Twitter.stub(:update).and_return(@twitter_obj)
        @twitter_obj.stub(:id).and_return('fake_id')
        @twitter_obj.stub(:text).and_return('fake_text')
        @current_user.stub(:name).and_return('fake_name')
        ComposeTweet.should_receive(:create_compose_tweet).with('fake_id', 'fake_text', 'fake_name')
        post :create, @valid_input      
      end
      it 'should redirect to the streams path' do
        Twitter.stub(:update).and_return(@twitter_obj)
        @twitter_obj.stub(:id).and_return('fake_id')
        @twitter_obj.stub(:text).and_return('fake_text')
        @current_user.stub(:name).and_return('fake_name')
        ComposeTweet.stub(:create_compose_tweet)
        post :create, @valid_input
        response.should redirect_to ('/streams')
      end
    end
    describe 'given invalid input' do
      before :each do
       @invalid_input = {:compose_tweet=>{'text'=>''}}
      end
      it 'should show a flash message' do
        post :create, @invalid_input
        flash[:notice].should == 'Please compose a tweet between 1 and 140 characters'
      end
      it 'should redirect to new compose tweet path' do
        post :create, @invalid_input
        response.should redirect_to ('/compose_tweets/new')
      end
    end
  end

  describe 'show 50 tweets with authors' do
    before :each do
      @current_twitter_user = double()
      @current_twitter_user.stub(:screen_name)
      @user_timeline = double()
      @user_timeline.stub(:take)
    end
    it 'should make the current Twitter user name available to the template' do
      Twitter.should_receive(:user).and_return(@current_twitter_user)
      Twitter.stub(:user_timeline).and_return(@user_timeline)
      Twitter.stub(:take)
      ComposeTweet.stub(:all)
      get :index
    end
    it 'shoud retrive the first 50 tweet from the user twitter account' do
      Twitter.stub(:user).and_return(@current_twitter_user)
      Twitter.should_receive(:user_timeline).and_return(@user_timeline)
      Twitter.stub(:take)
      ComposeTweet.stub(:all)
      get :index
    end
    it 'should make all compose tweet records availabel to the template'  do
      Twitter.stub(:user).and_return(@current_twitter_user)
      Twitter.stub(:user_timeline).and_return(@user_timeline)
      @user_timeline.should_receive(:take).with(50)
      ComposeTweet.should_receive(:all)
      get :index
    end 
  end
end
