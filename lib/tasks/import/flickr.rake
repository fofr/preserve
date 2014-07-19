require 'csv'
namespace :import do

  desc "Import flickr uploads from csv"
  task :flickr => :environment do

    data = CSV.read('/var/ifttt/flickr/uploaded-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      i["taken_timestmap"] = Time.parse(i["taken_timestmap"]).strftime("%Y-%m-%d %H:%M:%S")
      items << Flickr.new(i)
    end

    output = Flickr.import items
    puts "Flickr: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
