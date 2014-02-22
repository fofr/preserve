class Tweet < ActiveRecord::Base
  validates_uniqueness_of :tweet_id

  def url
    "http://www.twitter.com/fofr/status/#{tweet_id}"
  end
end
