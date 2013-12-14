require 'spec_helper'

describe StreamsController do

  before :each do
      @current_twitter_user = double()
      @current_twitter_user.stub(:screen_name)
      @user_timeline = double()
      @user_retweets = double()
      @user_timeline.stub(:take)
    end
  describe 'display tweets' do
    it 'should fetch all tweets of the user' do
      Twitter.should_receive(:home_timeline).and_return(@user_timeline)
      get :index 
    end
  end
  describe 'retweets of me' do
    it 'should display all retweets of the user' do
      Twitter.should_receive(:retweets_of_me).and_return(@user_retweets)
      get :new
    end
  end

end
