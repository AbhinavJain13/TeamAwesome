require 'twitter-text'
include Twitter::Autolink

class StreamsController < ApplicationController

before_filter :set_current_user

def index
  #@stream = Twitter.user_timeline
  #@current_twitter_user = Twitter.user
  @stream = Twitter.user_timeline(session[:screen_name])
  @current_twitter_user = session[:screen_name]
end

def new
  @stream = Twitter.user_timeline(session[:screen_name])
  @current_twitter_user = Twitter.user
  @myrt = Twitter.retweets_of_me()
end

end
