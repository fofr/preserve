class Weight < ActiveRecord::Base
  validates_uniqueness_of :timestamp
end
