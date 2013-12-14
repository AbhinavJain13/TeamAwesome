class ComposeTweet < ActiveRecord::Base
  attr_accessible :tid, :text, :author
  
  def self.create_compose_tweet (id, text, author)
    if id.is_a? Integer
      id = id.to_s
    end
    ComposeTweet.create(:tid=>id, :text=>text, :author=>author)
  end

  def 
end
