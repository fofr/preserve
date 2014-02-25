class Purchase < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :name, :amount]
end
