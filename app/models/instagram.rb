class Instagram < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :url]
end
