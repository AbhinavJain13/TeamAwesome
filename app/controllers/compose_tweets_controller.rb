class ComposeTweetsController < ApplicationController

before_filter :set_current_user

  def new
    render :partial=>'compose_tweet' and return if request.xhr?
    @current_twitter_user = Twitter.user
  end

  def create
    #@current_twitter_user = Twitter.user
    @tweet_text = params[:compose_tweet][:text]
    if @tweet_text.length > 0 
      @tweet = Twitter.update(params[:compose_tweet][:text])
      ComposeTweet.create_compose_tweet(@tweet.id, @tweet.text, @current_user.name)
      redirect_to streams_path 
    else 
      flash[:notice] = 'Please compose a tweet between 1 and 140 characters'
      redirect_to new_compose_tweet_path
    end
  end

end


