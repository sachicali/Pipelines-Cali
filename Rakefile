# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

require_relative 'config/boot'

task :environment do
  require_relative 'config/boot'
end

Dir.glob('lib/tasks/*.rake').each { |r| load r } 