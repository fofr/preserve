require 'csv'
namespace :import do

  desc "Import reminders from csv"
  task :reminders => :environment do

    data = CSV.read('/var/ifttt/reminders/completed-csv.txt', :headers => true)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["completed_timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      i["created_timestamp"] = Time.parse(i["created_timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      i.delete("completed_timestamp")
      items << Reminder.new(i)
    end

    output = Reminder.import items
    puts "Reminders: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
