namespace :import do

  desc "Import movies from IFTTT -> dropbox text file"
  task :movies => :environment do

    # Default IFTTT divider
    def new_movie_in_source(line)
      line =~ /\- \- \- \- \-/
    end

    def read_file(file)
      f = File.open(file.strip, encoding: 'UTF-8')
      lines = f.read
      f.close
      lines
    end

    lines = read_file('/var/ifttt/IMDB/Rated.txt')

    movies = []
    movie = Movie.new

    lines.each_line do |line|
      if new_movie_in_source(line)
        movies << movie
        movie = Movie.new
      else

        # Movie title (2004) or TV title (2004 TV-Series)
        if line.match(/\(\d{4}\)|\(\d{4}\s[\w\s\-]+\)/)
          matches = line.match(/(.*)\s\((\d{4})/)
          movie[:title] = matches[1].strip()
          movie[:year] = matches[2]

        # rated this 8.
        elsif line.match(/rated this/)
          movie[:rating] = line.match(/rated this (\d{1,2})/)[1]

        # http://www.imdb.com/title/tt0318462/
        elsif line.match(/\/title\/tt/)
          movie[:imdb_id] = line.match(/\/title\/tt(\d+)\//)[1]

        # January 05, 2014
        elsif line.match(/\d{1,2}, \d{4}/)
          timestamp = Time.parse(line)
          movie[:timestamp] = timestamp.strftime("%Y-%m-%d %H:%M:%S")
        end
      end
    end

    if movie[:title].present?
      movies << movie
    end

    movies.each do |m|
      puts "#{m[:title]} (#{m[:year]}), rated: #{m[:rating]} on #{m[:timestamp].strftime("%Y-%m-%d")}"
    end

    Movie.import movies
  end
end
