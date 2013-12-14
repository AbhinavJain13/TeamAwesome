class CreateComposeTweets < ActiveRecord::Migration
  def up
    create_table 'compose_tweets' do |t|
      t.string :author
      t.string :text
      t.string :tid
      t.timestamp
    end
  end

  def down
  end
end
