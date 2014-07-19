require 'csv'
namespace :import do

  desc "Import weather from csv"
  task :weather => :environment do

    data = CSV.read('/var/ifttt/weather/brighton-weather-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      i["sunrise"] = Time.parse(i["sunrise"]).strftime("%Y-%m-%d %H:%M:%S")
      i["sunset"] = Time.parse(i["sunset"]).strftime("%Y-%m-%d %H:%M:%S")
      items << Weather.new(i)
    end

    output = Weather.import items
    puts "Weather: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
