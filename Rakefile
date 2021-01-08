require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'creates database and runs migrations'
task :prepare_database do 
  Rake::Task['db::create'].invoke
  Rake::Task['db::migrate'].invoke

end

desc 'seeds database with newest fugitive data and starts app'
task :enter_database do 
  Rake::Task['db::seed'].invoke
  ruby "bin/run.rb"
end
