namespace :import do

  desc "Import location points from image EXIF data"
  task :image_locations => :environment do

    locations = []
    directory = '/var/ifttt/TEST/'
    files = Dir.entries(directory)

    # drop '.' and '..'
    files.drop(2).each do |file|
      exif = EXIFR::JPEG.new(directory + file)
      if exif.gps
        locations << Location.new(
          timestamp: exif.date_time.strftime("%Y-%m-%d %H:%M:%S"),
          latitude: exif.gps.latitude,
          longitude: exif.gps.longitude,
          altitude: exif.gps.altitude,
          direction: exif.gps.image_direction)
      end
    end

    Location.import locations
  end
end