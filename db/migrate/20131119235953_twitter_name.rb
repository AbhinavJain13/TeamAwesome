class TwitterName < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.string :twitterName
    end
  end

  def down
  end
end
