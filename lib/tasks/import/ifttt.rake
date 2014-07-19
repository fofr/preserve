namespace :import do
  task :ifttt do
    Rake::Task["import:facebook"].invoke
    Rake::Task["import:flickr"].invoke
    Rake::Task["import:github"].invoke
    Rake::Task["import:headlines"].invoke
    Rake::Task["import:instagram"].invoke
    Rake::Task["import:reminders"].invoke
    Rake::Task["import:weather"].invoke
    Rake::Task["import:weights"].invoke
  end
end
