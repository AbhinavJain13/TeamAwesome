class FixColumnType < ActiveRecord::Migration
  def up
    change_column :compose_tweets, :tid, :string
  end

  def down
    change_column :compose_tweets, :tid, :integer
  end
end
