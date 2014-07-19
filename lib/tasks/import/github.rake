require 'csv'
namespace :import do

  desc "Import github activity from csv"
  task :github => :environment do

    data = CSV.read('/var/ifttt/github/public-activity-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      items << Github.new(i)
    end

    output = Github.import items
    puts "Github: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
