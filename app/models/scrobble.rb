class Scrobble < ActiveRecord::Base
  validates_uniqueness_of :scrobble_id

  def artist_url
    "http://www.last.fm/music/#{prepare_url_string(self.artist)}"
  end

  def track_url
    "#{artist_url}/_/#{prepare_url_string(self.track)}"
  end

  private

  def prepare_url_string(string)
    string.gsub(' ', '+')
  end

end
