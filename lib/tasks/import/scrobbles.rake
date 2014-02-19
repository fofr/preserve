require 'csv'
namespace :import do

  desc "Import scrobbles from scrobbles.tsv"
  task :scrobbles => :environment do

    # http://stackoverflow.com/questions/4404787/whats-the-best-way-to-parse-a-tab-delimited-file-in-ruby
    data = CSV.read('data/scrobbles.tsv', {:col_sep => "\t"})

    scrobbles = []

    data.drop(1).each do |scrobble|
      scrobbles << Scrobble.new(
        :timestamp                   => scrobble[0],
        :track                       => scrobble[2],
        :artist                      => scrobble[4],
        :uncorrected_track           => scrobble[6],
        :uncorrected_artist          => scrobble[8],
        :album                       => scrobble[10],
        :album_artist                => scrobble[12],
        :application                 => scrobble[14],
        :scrobble_id                 => Digest::SHA1.hexdigest(scrobble[1] + scrobble[2] + scrobble[4] + scrobble[10])
      )
    end

    Scrobble.import scrobbles
  end
end
