class Scrobble < ActiveRecord::Base
    validates_uniqueness_of :scrobble_id
end
