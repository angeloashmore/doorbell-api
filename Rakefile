require 'rubygems'
require 'bundler'
require_relative 'db/db'
require 'dotenv/tasks'
require 'rspec/core/rake_task'

Bundler.require

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

RSpec::Core::RakeTask.new(:spec)
task default: [:ci]

desc 'Run CI tasks'
task ci: [:spec]

desc 'API Routes'
task routes: :environment do
  Doorbell::API::Base.routes.each do |api|
    method = api.route_method.ljust(10)
    path   = api.route_path
    puts "     #{method} #{path}"
  end
end

namespace :db do
  task setup: :dotenv do
    DB.setup
  end
end
