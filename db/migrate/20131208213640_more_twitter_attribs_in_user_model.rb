class MoreTwitterAttribsInUserModel < ActiveRecord::Migration
  def up
    change_table 'users' do |t|         
      t.string :oauth_token
      t.string :oauth_token_secret
    end
  end

  def down
  end
end
