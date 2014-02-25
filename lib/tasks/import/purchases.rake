namespace :import do

  desc "Import purchases from exported bank statement CSVs"
  task :purchases => :environment do

    purchases = []
    files = Dir.glob('data/purchases/*.csv')

    files.each do |file|
      data = CSV.read(file)
      data.each do |purchase|
        name_and_description = purchase[3].strip.split(/\s{2,}/)
        purchases << Purchase.new(
          :timestamp                   => Time.parse(purchase[0]).strftime("%Y-%m-%d %H:%M:%S"),
          :amount                      => purchase[2].strip,
          :name                        => name_and_description[0],
          :description                 => name_and_description[1]
        )
      end
    end

    Purchase.import purchases
  end
end
