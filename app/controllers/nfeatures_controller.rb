require 'twitter-text'
include Twitter::Autolink

class NfeaturesController < ApplicationController

before_filter :set_current_user


def create
  @nice = Nfeature.set_nice(params[:tweetid], @current_user)
  @current_twitter_user = Twitter.user
  redirect_to streams_path
end
def index
  @current_twitter_user = Twitter.user
  @output = Nfeature.get_nice
  @stream = @output[:tweets]
  @uname = @output[:uname]
end
def new
  @stream = Twitter.user_timeline("uiowa")
  @current_twitter_user = Twitter.user
  @notevalue=Nfeature.create({:tweetid => '2', :notecontent => params[:nfeature][:notecontent],:name => @current_user.name},:without_protection => true)
end

def show
  @current_twitter_user = Twitter.user   
end
def edit

end
end
