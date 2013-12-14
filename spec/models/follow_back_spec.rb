require 'spec_helper'

describe FollowBack do
  describe 'creating new follow back list' do
    it 'should have twitter friends with cursor method' do
      FollowBack.get_twitter_friends_with_cursor(0, [])
    end
    it 'should have get twitter followers with cursor method' do
      FollowBack.get_twitter_followers_with_cursor(0, [])
    end
  end
end


