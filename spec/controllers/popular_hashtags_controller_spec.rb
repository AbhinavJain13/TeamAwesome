require 'spec_helper'

describe PopularHashtagsController do

  before :each do
    @current_user = double()
    User.stub(:find_by_email).and_return(@current_user)
    @tweet1 = double()
    @tweet2 = double()
    @tweet3 = double()
    @tweet1.stub(:full_text).and_return('I love #cows and #cats')
    @tweet2.stub(:full_text).and_return('#dogs rule #cats drool')
    @tweet3.stub(:full_text).and_return('#dogs are the best and #cats are okay too')
  end

  describe 'show list of popular hashtags' do
    before :each do
      @timeline = [@tweet1, @tweet2, @tweet3]
    end
    it 'should retrieve the first 1000 tweets from the user twitter timeline' do
      Twitter.should_receive(:user)
      Twitter.should_receive(:home_timeline).and_return(@timeline)
      get :index
    end
    it 'should make hashtags and their corresponding tweets available to the template' do
      Twitter.stub(:user)
      Twitter.stub(:home_timeline).and_return(@timeline) 
      get :index
      assigns(:hashtags).should == [["#cats", [@tweet1, @tweet2, @tweet3]], ["#dogs", [@tweet2, @tweet3]], ["#cows", [@tweet1]]]
    end
  end

  describe 'make tweets with a given hashtag available to template' do
    it 'should make the hashtag and the full text of each tweet available to the template' do
      Twitter.stub(:user)
      Twitter.stub(:home_timeline)
      my_hashtags = [["#cats", [@tweet1, @tweet2, @tweet3]], ["#dogs", [@tweet2, @tweet3]], ["#cows", [@tweet1]]]
      controller.should_receive(:get_hashtags)
      controller.instance_variable_set(:@hashtags, my_hashtags)
      get :show, {:id=>"#dogs"}
      assigns(:tag).should == "#dogs"
      assigns(:tweets).should == [@tweet2, @tweet3]
    end
  end

end
