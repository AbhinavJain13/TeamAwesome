require 'spec_helper'

describe Nfeature do
  describe 'nicing tweets' do
    it 'should set nice tweet' do
      Nfeature.should_receive(:where).with(:tweetid=>'fakeid')
      Nfeature.should_receive(:create).with({:tweetid=>'fakeid', :isnice=>true, name:'fakename'}, :without_protection => true)
      Nfeature.set_nice('fakeid', 'fakename')
    end
  end
  describe 'getting nice tweets' do
    @tweetlist = [:return_value1, :return_value2]
    it 'should get nice tweets' do
      Nfeature.should_receive(:where).with(:isnice=>true).and_return(@tweetlist)
      Nfeature.get_nice
    end
  end
end


