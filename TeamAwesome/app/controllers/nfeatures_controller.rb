require 'twitter-text'
include Twitter::Autolink

class NfeaturesController < ApplicationController

before_filter :set_current_user

def create
  @nice = Nfeature.set_nice(params[:tweetid], @current_user)
  redirect_to streams_path
end
def index
  #@output = Nfeature.get_nice
  #@stream = @output[:tweets]
    redirect_to "http://www.fb.com"
#@uname = @output[:uname]
end
def new
  

  
  #@stream = Twitter.user_timeline("uiowa")
  #@current_twitter_user = Twitter.user
  #@myrt = Twitter.retweets_of_me()
  
end

def show
    @notevalue=Nfeature.new(params[:tweetid],@current_user)


end

end
