require 'csv'
namespace :import do

  desc "Import facebook statuses from csv"
  task :facebook_statuses => :environment do

    data = CSV.read('/var/ifttt/facebook/status-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      i.delete("from")
      items << FacebookLink.new(i)
    end

    output = FacebookStatus.import items
    puts "Facebook statuses: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
