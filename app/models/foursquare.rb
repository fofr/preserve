class Foursquare < ActiveRecord::Base
  validates_uniqueness_of :foursquare_id

end
