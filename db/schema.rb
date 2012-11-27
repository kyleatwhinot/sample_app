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

ActiveRecord::Schema.define(:version => 20121126170638) do

  create_table "asks", :force => true do |t|
    t.string   "description"
    t.string   "category"
    t.boolean  "public",           :default => false
    t.boolean  "done",             :default => false
    t.boolean  "followed_up",      :default => false
    t.string   "helper"
    t.integer  "user_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.date     "date_done"
    t.date     "date_followed_up"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.boolean  "done",             :default => false
    t.integer  "user_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.date     "date_done"
    t.date     "date_followed_up"
    t.datetime "due_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "memberships", ["group_id"], :name => "index_memberships_on_group_id"
  add_index "memberships", ["user_id", "group_id"], :name => "index_memberships_on_user_id_and_group_id", :unique => true
  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "messages", :force => true do |t|
    t.string   "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "ask_id"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "outcomes", :force => true do |t|
    t.string  "description"
    t.integer "ask_id"
    t.integer "contact_id"
    t.string  "dominant_emotion"
    t.integer "user_id"
    t.string  "ignored_terms"
    t.float   "affection_friendliness"
    t.float   "enjoyment_elation"
    t.float   "amusement_excitement"
    t.float   "contentment_gratitude"
    t.float   "sadness_grief"
    t.float   "anger_loathing"
    t.float   "fear_uneasiness"
    t.float   "humiliation_shame"
    t.string  "sentiment"
    t.float   "sentiment_score"
    t.float   "coverage"
    t.string  "intense_sentence"
    t.string  "i_sentence_emotion"
    t.float   "i_sentence_intensity"
    t.float   "clarity"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",            :default => false
    t.integer  "timezone",         :default => -5
    t.boolean  "text_alerts",      :default => true
    t.string   "phone_number"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "location"
    t.string   "image_url"
    t.integer  "contacts_count",   :default => 0
    t.integer  "asks_count",       :default => 0
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token", :unique => true

end
