namespace :generate do

  desc "Generate daily activity logs from events"
  task :activity => :environment do

    activities = []
    tweets = Tweet.all
    tweets.each do |tweet|
      activities << Activity.new(:activity_class => Tweet.to_s, :activity_id => tweet.id, :date => tweet.timestamp)
    end

    foursquare = Foursquare.all
    foursquare.each do |checkin|
      activities << Activity.new(:activity_class => Foursquare.to_s, :activity_id => checkin.id, :date => checkin.timestamp)
    end

    scrobbles = Scrobble.all
    scrobbles.each do |scrobble|
      scrobbles << Activity.new(:activity_class => Scrobble.to_s, :activity_id => scrobble.id, :date => scrobble.timestamp)
    end

    Activity.import activities
  end
end
