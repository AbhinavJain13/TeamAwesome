class ComposeTweet < ActiveRecord::Base
  attr_accessible :id, :text, :author
  
  def self.create_compose_tweet (id, text, author)
    ComposeTweet.create(:id=>id, :text=>text, :author=>author)
  end
end
