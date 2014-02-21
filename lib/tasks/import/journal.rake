namespace :import do

  desc "Import journal (day one) entries from markdown export"
  task :journal => :environment do

    def new_entry_in_source(line)
      line =~ /Date\:\s+\d/
    end

    def read_file(file)
      f = File.open(file.strip, encoding: 'UTF-8')
      lines = f.read
      f.close
      lines
    end

    lines = read_file('data/dayone.md')
    entries = []
    entry = nil

    lines.each_line do |line|
      if new_entry_in_source(line)
        if entry
          entry[:text] = entry[:text].strip().sub(/\n/,'')
          entries << entry
          puts entries.size
          puts entry[:timestamp]
        end

        date = line.gsub(/\s+Date\:\s+/,'').strip()
        timestamp = Time.parse(date).strftime("%Y-%m-%d %H:%M:%S")

        entry = Journal.new
        entry[:timestamp] = timestamp
        entry[:journal_id] = timestamp.to_i
        entry[:text] = ''
      elsif entry
        entry[:text] = entry[:text] + line
      end
    end
    entries << entry

    Journal.import entries
  end
end
