require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start if ENV['CODECLIMATE_REPO_TOKEN']

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec'
require 'rack/test'

require_rel 'support'

include PrepareDB

begin
  create_database('test_db')
  create_table('test_db', :billings)
  create_table('test_db', :plans)
  create_table('test_db', :teams)
  create_table('test_db', :team_members)
  create_table('test_db', :users)

  rql.db('test_db').table(:plans).insert(name: 'Default', type: 'user').run(connection)
  rql.db('test_db').table(:plans).insert(name: 'Default', type: 'team').run(connection)
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include PrepareDB

  config.order = :random
end
