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

ActiveRecord::Schema.define(version: 20140225184627) do

  create_table "activities", force: true do |t|
    t.string   "activity_class"
    t.integer  "activity_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_links", force: true do |t|
    t.datetime "timestamp"
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.text     "message"
    t.string   "from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_links", ["timestamp"], name: "facebook_link_timestamp_ix", using: :btree

  create_table "facebook_statuses", force: true do |t|
    t.datetime "timestamp"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_statuses", ["timestamp"], name: "facebook_status_timestamp_ix", using: :btree

  create_table "flickrs", force: true do |t|
    t.datetime "timestamp"
    t.string   "title"
    t.string   "flickr_url"
    t.text     "description"
    t.datetime "taken_timestmap"
    t.string   "original_source_url"
    t.string   "source_url"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flickrs", ["timestamp"], name: "flickr_timestamp_ix", using: :btree

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

  add_index "foursquares", ["timestamp"], name: "foursquare_timestamp_ix", using: :btree

  create_table "githubs", force: true do |t|
    t.datetime "timestamp"
    t.string   "title"
    t.string   "url"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "githubs", ["timestamp"], name: "github_timestamp_ix", using: :btree

  create_table "headlines", force: true do |t|
    t.datetime "timestamp"
    t.string   "headline"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "headlines", ["timestamp"], name: "headline_timestamp_ix", using: :btree

  create_table "instagrams", force: true do |t|
    t.datetime "timestamp"
    t.string   "url"
    t.string   "source_url"
    t.text     "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instagrams", ["timestamp"], name: "instagram_timestamp_ix", using: :btree

  create_table "journals", force: true do |t|
    t.text     "text"
    t.string   "journal_id"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journals", ["timestamp"], name: "journal_timestamp_ix", using: :btree

  create_table "locations", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.string   "altitude"
    t.string   "direction"
    t.datetime "timestamp"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["timestamp"], name: "location_timestamp_ix", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "rating"
    t.string   "imdb_id"
    t.datetime "timestamp"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movies", ["timestamp"], name: "movies_timestamp_ix", using: :btree

  create_table "purchases", force: true do |t|
    t.string   "amount"
    t.string   "name"
    t.string   "description"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["timestamp"], name: "purchase_timestamp_ix", using: :btree

  create_table "reminders", force: true do |t|
    t.datetime "timestamp"
    t.datetime "created_timestamp"
    t.string   "title"
    t.string   "notes"
    t.string   "priority"
    t.string   "list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reminders", ["timestamp"], name: "reminder_timestamp_ix", using: :btree

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

  add_index "scrobbles", ["timestamp"], name: "scrobble_timestamp_ix", using: :btree

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

  add_index "tweets", ["timestamp"], name: "tweets_timestamp_ix", using: :btree

  create_table "weathers", force: true do |t|
    t.datetime "timestamp"
    t.string   "todays_condition"
    t.string   "high_temp_celsius"
    t.string   "low_temp_celsius"
    t.string   "current_temp_celsius"
    t.string   "current_condition"
    t.string   "wind_speed_mph"
    t.string   "wind_direction"
    t.string   "pollen_count"
    t.string   "uv_index"
    t.string   "humidity"
    t.datetime "sunrise"
    t.datetime "sunset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weathers", ["timestamp"], name: "weather_timestamp_ix", using: :btree

  create_table "weights", force: true do |t|
    t.datetime "timestamp"
    t.string   "weight_kg"
    t.string   "lean_mass_kg"
    t.string   "fat_mass_kg"
    t.string   "fat_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weights", ["timestamp"], name: "weight_timestamp_ix", using: :btree

end
