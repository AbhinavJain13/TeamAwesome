class FollowBackController < ApplicationController

  before_filter :set_current_user

  def index
    @current_twitter_user = Twitter.user

    #@followers = Twitter.followers()
    #@followerArray = Array.new

    @followers = FollowBack.get_twitter_followers_with_cursor(-1,[])
    @followerArray = Array.new

    @followers.each do |follower|
      @followerArray.push([follower.name, follower.screen_name])
    end


    @following = FollowBack.get_twitter_friends_with_cursor(-1,[])
    @followingArray = Array.new

    @following.each do |follower|
      @followingArray.push([follower.name, follower.screen_name])
    end

    @results = @followingArray - @followerArray #set difference
    if @results == []
      flash[:notice] = "You have exceeded the rate limit Twitter imposes.  You will need to wait as much as 15 minutes before trying to reload this page."
    end
     
  end

end



