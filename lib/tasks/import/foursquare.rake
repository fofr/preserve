require 'open-uri'
namespace :import do

  desc "Import foursquare checkins from RSS feed"
  task :foursquare => :environment do

    SimpleRSS.item_tags << :"georss:point"
    response = SimpleRSS.parse open('data/foursquare.rss')
    foursquare_checkins = []

    response.items.each do |item|
      foursquare_checkins << Foursquare.new(
        :venue         => item[:title],
        :description   => item[:description].gsub("@ #{item[:title]}", '').strip(),
        :latitude      => item[:georss_point].split(' ')[0],
        :longitude     => item[:georss_point].split(' ')[1],
        :foursquare_id => item[:guid],
        :timestamp     => item[:pubDate]
      )
    end

    Foursquare.import foursquare_checkins
  end
end
