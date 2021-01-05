require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

# desc 'seeds database with newest fugitive data and starts app'
# task :start_app do 
#   Rake::Task['db::seed'].invoke
#   ruby "bin/run.rb"
# end
