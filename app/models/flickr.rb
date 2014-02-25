class Flickr < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :flickr_url]
end
