class FacebookLink < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :link]
end
