class Github < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :title]
end
