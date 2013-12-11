class PopularHashtagsController < ApplicationController

before_filter :set_current_user, :get_hashtags

  def get_hashtags 
    timeline = Twitter.home_timeline
    @hashtags = {}
    timeline.each do |tweet|
      tags = tweet.full_text.scan(/#\S*/)
      tags.each do |tag|
        match = false
        @hashtags.keys.each do |hashtag|
          if match == true then
            break
          end
          if tag == hashtag
            @hashtags[hashtag].push(tweet)
            match = true
          end
        end
        if match == false
          @hashtags[tag] = [tweet]
        end
      end
    end
    @hashtags = @hashtags.sort_by{|key, value| value.length}.reverse 
  end

  def index
    @current_twitter_user = Twitter.user
  end

  def show
    @current_twitter_user = Twitter.user
    @tag = params[:id] 
    @tweets = []
    @hashtags.each do |hashtag|
      if hashtag[0] == @tag 
        @tweets = hashtag[1]
        break
      end
    end
  end
end
