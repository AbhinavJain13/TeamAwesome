require 'spec_helper'

describe PopularHashtagsController do

  before :each do
   @current_user = double()
   User.stub(:find_by_session_token).and_return(@current_user)
  end

  describe 'show list of popular hashtags' do

    before :each do
      @tweet1 = double()
      @tweet2 = double()
      @tweet3 = double()
      @tweet1.stub(:full_text).and_return('I love #cows and #cats')
      @tweet2.stub(:full_text).and_return('#dogs rule #cats drool')
      @tweet3.stub(:full_text).and_return('#dogs are the best and #cats are okay too')
      @tweet1.stub(:id).and_return('123')
      @tweet2.stub(:id).and_return('456')
      @tweet3.stub(:id).and_return('789')
      @timeline = [@tweet1, @tweet2, @tweet3]
    end
    it 'should retrieve the first 1000 tweets from the user twitter timeline' do
      Twitter.should_receive(:user)
      Twitter.should_receive(:home_timeline).and_return(@timeline)
      get :index
    end
    it 'should make hashtags and their corresponding tweet ids available to the template' do
      Twitter.stub(:user)
      Twitter.stub(:home_timeline).and_return(@timeline) 
      get :index
      assigns(:hashtags).should == [["#cats", ["123", "456", "789"]], ["#dogs", ["456", "789"]], ["#cows", ["123"]]]
    end
  end
end
