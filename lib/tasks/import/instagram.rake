require 'csv'
namespace :import do

  desc "Import instagram from csv"
  task :instagram => :environment do

    data = CSV.read('/var/ifttt/instagram/uploaded-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      items << Instagram.new(i)
    end

    output = Instagram.import items
    puts "Instagram: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
