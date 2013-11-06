class CreateUser < ActiveRecord::Migration
  def up
    create_table 'users' do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :session_token
      t.timestamp
    end
  end

  def down
  end
end
