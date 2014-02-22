class Foursquare < ActiveRecord::Base
  validates_uniqueness_of :foursquare_id

  def url
    "https://foursquare.com/fofr/checkin/#{self.foursquare_id}"
  end
end
