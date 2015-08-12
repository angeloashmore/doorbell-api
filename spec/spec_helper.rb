require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

require File.expand_path('../../config/environment', __FILE__)
require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

require_rel('support')

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include PrepareDB

  config.order = :random

  config.before(:all) do
    create_database('test_db')
  end

  config.after(:all) do
    create_database('test_db')
  end
end
