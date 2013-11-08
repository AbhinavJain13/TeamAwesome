require 'twitter-text'
include Twitter::Autolink

class StreamsController < ApplicationController

before_filter :set_current_user

def index
  @stream = Twitter.user_timeline("uiowa")
<<<<<<< HEAD
  @current_twitter_user = Twitter.user
end

def new
=======
  #@current_user = Twitter.user
>>>>>>> develop
end

end
