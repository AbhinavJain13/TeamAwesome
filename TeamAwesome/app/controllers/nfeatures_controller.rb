class NfeaturesController < ApplicationController

before_filter :set_current_user

def create
  @nice = params[:tweetid]
end

def new
  @stream = Twitter.user_timeline("uiowa")
  @current_twitter_user = Twitter.user
  @myrt = Twitter.retweets_of_me()
end

end
