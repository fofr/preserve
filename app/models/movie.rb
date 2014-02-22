class Movie < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :title]

  def url
    "http://www.imdb.com/title/tt#{imdb_id}"
  end
end
