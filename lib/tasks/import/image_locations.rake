namespace :import do

  desc "Import location points from image EXIF data"
  task :image_locations => :environment do

    locations = []
    #directory = '/var/images/'
    #files = Dir.entries(directory).select {|f| f.match(/\.jpg/) == true}
    #files = Dir.glob('/var/images/*iPhone*/*/*.JPG')
    files = Dir.glob('/var/images/*iPhone*/*.JPG')

    # drop '.' and '..'
    files.drop(2).each do |file|
      begin
        exif = EXIFR::JPEG.new(file)
        if exif.gps && exif.date_time
          locations << Location.new(
            timestamp: exif.date_time.strftime("%Y-%m-%d %H:%M:%S"),
            latitude: exif.gps.latitude,
            longitude: exif.gps.longitude,
            altitude: exif.gps.altitude,
            direction: exif.gps.image_direction)
        end
      rescue
        next
      end
    end

    Location.import locations
  end
end
