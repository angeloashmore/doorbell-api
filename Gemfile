source 'https://rubygems.org'

# Ruby requirements
ruby '2.2.2'

# Server requirements
gem 'thin', '~> 1.6.3'
gem 'dotenv', '~> 2.0.2'

# Project requirements
group :development do
  gem 'rubocop', '~> 0.32.1'
  gem 'rake', '~> 10.4.2'
  gem 'racksh', '~> 1.0.0'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'codeclimate-test-reporter', require: false
end

# Framework requirements
gem 'rack', '~> 1.6.0'
gem 'rack-cors', '~> 0.4.0'
gem 'grape', '~> 0.12.0'
gem 'roar', '~> 1.0.1', require: false
gem 'grape-roar', '~> 0.3.0'
gem 'mutations', '~> 0.7.2'
gem 'oj', '~> 2.12.9'

# Authentication/Authorization requirements
gem 'jwt', '~> 1.5.1'
gem 'canable', '~> 0.3.0'
gem 'bitmask', '~> 0.1.0'

# Persistence requirements
gem 'virtus', '~> 1.0.5'
gem 'rom-rethinkdb', github: 'angeloashmore/rom-rethinkdb'

# Other requirements
gem 'require_all', '~> 1.3.2'
gem 'email_regex', '~> 0.0.1'
gem 'stripe', '~> 1.23.0'
