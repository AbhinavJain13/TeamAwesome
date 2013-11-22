class DifferentFeatures < ActiveRecord::Migration
  def up
	create_table 'features' do |t|
	  t.string :name
	  t.string :notecontent
	  t.boolean :isnice
	  t.string :tweetid
	  t.timestamp
	end
  end

  def down
  end
end
