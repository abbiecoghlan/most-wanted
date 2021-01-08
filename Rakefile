require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'creates database, runs migrations, seeds data, and starts app'
task :prepare_database do 
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:seed'].invoke
  ruby "bin/run.rb"
end

desc 'starts app'
task :enter do 
  ruby "bin/run.rb"
end
