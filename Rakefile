require 'rubygems'
require 'bundler'
require 'rom/sql/rake_task'
require_relative 'db/db'

Bundler.require

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('../config/environment', __FILE__)
end

desc "API Routes"
task routes: :environment do
  Doorbell::API.routes.each do |api|
    method = api.route_method.ljust(10)
    path   = api.route_path
    puts "     #{method} #{path}"
  end
end

namespace :db do
  task :setup do
    DB.setup
  end
end
