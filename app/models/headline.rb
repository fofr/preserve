class Headline < ActiveRecord::Base
  validates_uniqueness_of [:timestamp, :url]
end
