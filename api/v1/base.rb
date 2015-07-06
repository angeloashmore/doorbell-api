module Doorbell
  module API
    module V1
      class Base < Grape::API
        # Common Grape settings.
        version 'v1'
        format :json
        formatter :json, Grape::Formatter::Roar

        # Load global helpers.
        helpers Doorbell::API::V1::Helpers::Base

        # Mount all resource APIs.
        mount Doorbell::API::V1::Teams
      end
    end
  end
end
