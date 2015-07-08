require 'dotenv'
Dotenv.load

ENV['RACK_ENV'] ||= 'development'

# Tell foreman to print to stdout.
$stdout.sync = true

require_relative 'application'
