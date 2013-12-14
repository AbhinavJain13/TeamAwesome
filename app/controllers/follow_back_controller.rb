class FollowBackController < ApplicationController

  before_filter :set_current_user

  def index
    @current_twitter_user = Twitter.user

 
    #@followers = Twitter.followers()
    #@followerArray = Array.new

    @followers, @followerRateError = FollowBack.get_twitter_followers_with_cursor(-1,[])

    
    @followerArray = Array.new

    @followers.each do |follower|
      @followerArray.push([follower.name, follower.screen_name])
    end


    @following, @followingRateError = FollowBack.get_twitter_friends_with_cursor(-1,[])
    @followingArray = Array.new

    @following.each do |follower| 
      @followingArray.push([follower.name, follower.screen_name])
    end

    @results = @followingArray - @followerArray #set difference
    if @results == []
      #Approximately
      if ((@followingArray == [] and @followingRateError == true) or (@followerArray == [] and @followerRateError == true))
        flash[:notice] = "You have exceeded the rate limit Twitter imposes.  You will need to wait as much as 15 minutes before trying to load this page again."
      elsif (@followerArray == [])
        flash[:notice] = "No one follows you!"
      elsif (@followingArray == [])
        flash[:notice] = "You don't follow anyone!"
      else
        flash[:notice] = "Everyone you follow follows you!"
      end
    end
  end

end




