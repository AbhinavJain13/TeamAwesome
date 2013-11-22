class Nfeature < ActiveRecord::Base

  attr_accessible :tweet_id
  def set_nice params
    #Nfeature.find_all(:tweet_id => params[0], :nice => true);
  end

end
