class PopularHashtagsController < ApplicationController

before_filter :set_current_user

  def index
    @current_twitter_user = Twitter.user
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
            @hashtags[hashtag].push(tweet.id)
            match = true
          end
        end
        if match == false
          @hashtags[tag] = [tweet.id]
        end
      end
    end
    @hashtags = @hashtags.sort_by{|key, value| value.length}.reverse 
  end
end
