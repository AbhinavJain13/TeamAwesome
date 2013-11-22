require 'spec_helper'

describe ComposeTweetsController do
  describe 'adding compose tweet' do
    before :each do
      @fake_data = {:compose_tweet=>{'text'=>'tweet text'}}
      @fake_tweet = double()
    end
    describe 'valid input' do
      pending 'call to Twitter'
      it 'should use the Twitter gem to compose a tweet' do 
        Twitter.should_receive(:update).with('tweet text').and_return(@fake_tweet)
        post :create, @fake_data
      end
      it 'should call the model method to create a new compose tweet record' do
        pending 'call to Twitter'
        #Twitter.should_receive(:update).and_return(@fake_tweet)
        #ComposeTweet.should_receive(:create_compose_tweet).with(@fake_tweet[:id], @fake_tweet[:text], "Mr. Magoo")
        #post :create, @fake_data       end
      it 'should redirect to the streams path'
    end
    describe 'invalid input' do
      it 'should show a flash message' do
        
        post :create, {:compose_tweet=>{'text'=>''}
      end
    end
  end
end
