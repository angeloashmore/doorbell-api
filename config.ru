require_relative 'config/environment'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end
end

run Doorbell::API::Base
