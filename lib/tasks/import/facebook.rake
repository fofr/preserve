namespace :import do
  task :facebook do
    Rake::Task["import:facebook_links"].invoke
    Rake::Task["import:facebook_statuses"].invoke
  end
end
