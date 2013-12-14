class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :compose_tweets, :id, :tid
  end

  def down
  end
end
