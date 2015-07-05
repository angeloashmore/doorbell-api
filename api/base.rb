module Doorbell
  module API
    class Base < Grape::API
      # Mount APIs.
      mount Doorbell::API::V1::Base
    end
  end
end
