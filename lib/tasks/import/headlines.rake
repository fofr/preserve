require 'csv'
namespace :import do

  desc "Import headlines from csv"
  task :headlines => :environment do

    data = CSV.read('/var/ifttt/bbc/bbc-headlines-csv.txt', :headers => true, :row_sep => :auto)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      items << Headline.new(i)
    end

    output = Headline.import items
    puts "Headlines: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
