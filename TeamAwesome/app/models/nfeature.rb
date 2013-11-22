class Nfeature < ActiveRecord::Base

  attr_accessible :tweetid, :isnice
  def self.set_nice params
    @nicevalue = Nfeature.where(:tweetid => params, :isnice => false)


    if @nicevalue.empty?
      Nfeature.create({:tweetid=> params, :isnice=> true}, :without_protection => true)
    else
      Nfeature.where(:tweetid => params, :isnice => false).update_all(:isnice=>true)
    end

  end
end
