module Doorbell
  module API
    module V1
      class Base < Grape::API
        # Common Grape settings.
        version 'v1'
        format :json
        formatter :json, Grape::Formatter::Roar

        # Define global rescuers.
        rescue_from InvalidTokenError do |e|
          error!('Invalid authentication token', 401)
        end

        # rescue_from :all do |e|
        #   error!(e.message)
        # end

        # Load global helpers.
        helpers Canable::Enforcers
        helpers Doorbell::API::V1::Helpers::Base

        # Mount all resource APIs.
        mount Doorbell::API::V1::Billings
        mount Doorbell::API::V1::Plans
        mount Doorbell::API::V1::Teams
        mount Doorbell::API::V1::TeamMembers
        mount Doorbell::API::V1::Users
      end
    end
  end
end
