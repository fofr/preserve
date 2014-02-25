class FacebookStatus < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :message]
end
