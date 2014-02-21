require 'csv'
namespace :import do

  desc "Import tweets from tweets.csv"
  task :tweets => :environment do

    data = CSV.read('data/tweets.csv')

    tweets = []

    data.drop(1).each do |t|
      tweet = Tweet.new(
        :tweet_id                    => t[0].to_s,
        :in_reply_to_status_id       => t[1].to_s,
        :in_reply_to_user_id         => t[2].to_s,
        :timestamp                   => Time.parse(t[3]).strftime("%Y-%m-%d %H:%M:%S"),
        :source                      => t[4].gsub(/<[^>]+>/, ''),
        :text                        => t[5].gsub(/\n/, ''),
        :retweeted_status_id         => t[6].to_s,
        :retweeted_status_user_id    => t[7].to_s,
        :expanded_urls               => t[9]
      )

      if t[8].present?
        tweet[:retweeted_status_timestamp] = Time.parse(t[8]).strftime("%Y-%m-%d %H:%M:%S")
      end

      tweets << tweet
    end

    Tweet.import tweets
  end
end
