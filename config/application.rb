require_relative 'boot'
require_relative '../db/db'
Bundler.require :default, ENV['RACK_ENV']

DB.setup

require_rel '../api'
