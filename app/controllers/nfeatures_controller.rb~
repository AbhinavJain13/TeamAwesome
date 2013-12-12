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
# used to show all notes
def new
   @stream = Twitter.user_timeline("uiowa")
   @current_twitter_user = Twitter.user
   @notevalue=Nfeature.create({:tweetid => '2', :notecontent => params[:nfeature][:notecontent],:name =>     @current_user.name},:without_protection => true)
   @tweet_with_notes = Nfeature.where(:name => @current_user.name)
end

# used to show form for writing Notes
def show
  @current_twitter_user = Twitter.user 
    
end
# to get tweets with notes
def note
    @current_twitter_user = Twitter.user 
    @tweet_with_notes = Nfeature.where(:name => @current_user.name)
    #redirect_to  "http://google.com"

end

# to get popular tweets
def popular
    redirect_to "http://www.fb.com"
    @current_twitter_user = Twitter.user 
    @my_timeline=Twitter.user_timeline(@current_twitter_user.screen_name, :count => 200)
    @myhash = Hash.new(0)
    @my_timeline.each do |tweet|
  	@myhash[auto_link(tweet.full_text).html_safe] = tweet.favorite_count + tweet.retweet_count
    end 
    @pop_tweets = Hash[@myhash.sort_by{|k,v| v}.reverse]




end
end
