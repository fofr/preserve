require 'csv'
namespace :import do

  desc "Import weights from csv"
  task :weights => :environment do

    data = CSV.read('/var/ifttt/withings/measurements-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      items << Weight.new(i)
    end

    output = Weight.import items
    puts "Weights: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
