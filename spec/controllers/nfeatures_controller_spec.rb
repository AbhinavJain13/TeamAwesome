require 'spec_helper'

describe NfeaturesController do

   before :each do
   @current_user = double()
   @current_twitter_user = double()
   User.stub(:find_by_email).and_return(@current_user)
   @tweet4 = double()
   @tweet5 = double()
   @tweet6 = double()
   @tweet4.stub(:retweet_count).and_return(3)
   @tweet5.stub(:favorite_count).and_return(2)
   @tweet6.stub(:retweet_count).and_return(1)
   @tweet4.stub(:full_text).and_return("most popular tweet")
   @tweet5.stub(:full_text).and_return("mediocre tweet")
   @tweet6.stub(:full_text).and_return("least polular tweet")
  end

  describe 'show list of popular tweets' do
    before :each do
      @pop_timeline = [@tweet4, @tweet5, @tweet6]
      @current_twitter_user = double()
    end
    it 'should retrieve the first 1000 tweets from the user twitter timeline' do
      Twitter.should_receive(:user).and_return(@current_twitter_user)
      Twitter.should_receive(:user_timeline).and_return(@pop_timeline)
      #get :popular
    end
    it 'should make counts and their corresponding tweets available to the template' do
      Twitter.stub(:user)
      Twitter.stub(:home_timeline).and_return(@pop_timeline) 
      get :popular
      assigns(:pop_tweets).should == ["most popular tweets" => 3, "mediocre tweet" => 2 , "least polular tweet" => 1 ]
    end
  end 
 
  describe 'add note to a tweet' do
     before :each do
       @note1= "first note"
       @note2= "second note"
  end
  it 'should add notes to tweets' do
      @current_twitter_user = double() 
      Nfeature.should_receive(:notecontent => "first note").with("first note")  

	end 

  end
 
end
