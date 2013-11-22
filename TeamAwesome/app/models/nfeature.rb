class Nfeature < ActiveRecord::Base

  attr_accessible :tweet_id
  def set_nice params
    @nicevalue = Nfeature.find_all(:tweet_id => params[0], :isnice => true);
    if !@nicevalue
      Nfeature.create(:tweetid=> params, :isnice=> true);
    else
      @nicevalue.update_all
  end

end
