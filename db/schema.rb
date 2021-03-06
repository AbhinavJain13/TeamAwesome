# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131214035630) do

  create_table "compose_tweets", :force => true do |t|
    t.string "tid",    :null => false
    t.string "author"
    t.string "text"
  end

  create_table "features", :force => true do |t|
    t.string  "name"
    t.string  "notecontent"
    t.boolean "isnice"
    t.string  "tweetid"
  end

  create_table "nfeatures", :force => true do |t|
    t.string  "name"
    t.string  "notecontent"
    t.boolean "isnice"
    t.string  "tweetid"
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "session_token"
    t.string "uid"
    t.string "provider"
    t.string "twitterName"
    t.string "oauth_token"
    t.string "oauth_token_secret"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token"

end
