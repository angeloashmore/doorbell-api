require 'dotenv'
Dotenv.load

ENV['RACK_ENV'] ||= 'development'

require_relative 'application'
