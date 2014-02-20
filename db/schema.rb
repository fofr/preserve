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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140219220336) do

  create_table "activities", force: true do |t|
    t.string   "activity_class"
    t.integer  "activity_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foursquares", force: true do |t|
    t.string   "venue"
    t.string   "description"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "foursquare_id"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foursquares", ["timestamp"], name: "foursquare_timestamp_ix"

  create_table "scrobbles", force: true do |t|
    t.datetime "timestamp"
    t.string   "track"
    t.string   "artist"
    t.string   "album"
    t.string   "uncorrected_track"
    t.string   "uncorrected_artist"
    t.string   "album_artist"
    t.string   "application"
    t.string   "scrobble_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scrobbles", ["timestamp"], name: "scrobble_timestamp_ix"

  create_table "tweets", force: true do |t|
    t.text     "text"
    t.string   "tweet_id"
    t.string   "source"
    t.string   "in_reply_to_status_id"
    t.string   "in_reply_to_user_id"
    t.string   "retweeted_status_id"
    t.string   "retweeted_status_user_id"
    t.datetime "timestamp"
    t.datetime "retweeted_status_timestamp"
    t.text     "expanded_urls"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["timestamp"], name: "tweets_timestamp_ix"

end
