require_relative 'boot'
require_relative '../db/db'

Bundler.require :default, ENV['RACK_ENV']

require 'roar/representer'
require 'roar/json'
require 'roar/json/hal'

DB.setup

require_rel '../api'
