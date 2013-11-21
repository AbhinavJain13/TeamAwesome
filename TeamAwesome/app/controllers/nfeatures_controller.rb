class NfeaturesController < ApplicationController

before_filter :set_current_user

def index
  @nice_value = Feature.nice(params)
end

def new
  @stream = Twitter.user_timeline("uiowa")
  @current_twitter_user = Twitter.user
  @myrt = Twitter.retweets_of_me()
end

end
