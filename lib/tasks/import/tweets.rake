require 'csv'
namespace :import do

  desc "Import tweets from tweets.csv"
  task :tweets => :environment do

    data = CSV.read('data/tweets.csv')

    tweets = []

    data.drop(1).each do |tweet|
      tweets << Tweet.new(
        :tweet_id                    => tweet[0],
        :in_reply_to_status_id       => tweet[1],
        :in_reply_to_user_id         => tweet[2],
        :timestamp                   => tweet[3],
        :source                      => tweet[4].gsub(/<[^>]+>/, ''),
        :text                        => tweet[5].gsub(/\n/, ''),
        :retweeted_status_id         => tweet[6],
        :retweeted_status_user_id    => tweet[7],
        :retweeted_status_timestamp  => tweet[8],
        :expanded_urls               => tweet[9]
      )
    end

    Tweet.import tweets
  end
end
