class Journal < ActiveRecord::Base
  validates_uniqueness_of [:journal_id, :text]
end
