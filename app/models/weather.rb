class Weather < ActiveRecord::Base
  validates_uniqueness_of :timestamp
end
