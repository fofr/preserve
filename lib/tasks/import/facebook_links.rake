require 'csv'
namespace :import do

  desc "Import facebook links from csv"
  task :facebook_links => :environment do

    # :row_sep => :auto fixes end of line whitespace problems
    # http://stackoverflow.com/questions/11548637/csv-unquoted-fields-do-not-allow-r-or-n-line-2
    data = CSV.read('/var/ifttt/facebook/links-csv.txt', :headers => true, :row_sep => :auto)
    items = []

    data.each do |i|
      i = i.to_hash
      i["timestamp"] = Time.parse(i["timestamp"]).strftime("%Y-%m-%d %H:%M:%S")
      items << FacebookLink.new(i)
    end

    output = FacebookLink.import items
    puts "Facebook links: Found #{items.size}, created #{items.size - output[:failed_instances].size}"
  end
end
