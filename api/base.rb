module Doorbell
  module API
    class Base < Grape::API
      prefix :api

      # Mount APIs.
      mount Doorbell::API::V1::Base
    end
  end
end
