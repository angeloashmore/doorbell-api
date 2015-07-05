module Doorbell
  module API
    module V1
      class Base < Grape::API
        # Common Grape settings.
        version 'v1'
        format :json

        rescue_from Grape::Exceptions::Validation do |e|
          Rack::Response.new({
            status:  e.status,
            message: e.message,
            param:   e.param
          }.to_json, e.status)
        end

        # Load global helpers.
        helpers Doorbell::API::V1::Helpers::Base

        # Mount all resource APIs.
        mount Doorbell::API::V1::Teams
      end
    end
  end
end
