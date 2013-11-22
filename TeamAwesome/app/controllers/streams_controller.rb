require 'twitter-text'
include Twitter::Autolink

class StreamsController < ApplicationController

before_filter :set_current_user

def index
  @stream = Twitter.home_timeline
  @current_twitter_user = Twitter.user
  @randomtweet = Twitter.status(403674450089885696)
end

def new
  @stream = Twitter.user_timeline("uiowa")
  @current_twitter_user = Twitter.user
  @myrt = Twitter.retweets_of_me()
end

end
