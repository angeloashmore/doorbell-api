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
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: false
end

# Framework requirements
gem 'rack', '~> 1.6.0'
gem 'grape', '~> 0.11.0'
gem 'roar', '~> 1.0.1', require: false
gem 'grape-roar', '~> 0.3.0'
gem 'kaminari', '~> 0.16.3', require: 'kaminari/grape'

# Persistence requirements
gem 'virtus', '~> 1.0.5'
gem 'rom', '~> 0.8.0'
gem 'rom-sql', '~> 0.5.2'
gem 'pg', '~> 0.18.2'
gem 'sequel_postgresql_triggers', '~> 1.0.8'

# Other requirements
gem 'require_all', '~> 1.3.2'
