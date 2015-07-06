module Doorbell
  module API
    module V1
      module Presenters
        module TeamsPresenter
          include Roar::JSON::HAL
          include Roar::Hypermedia
          include Grape::Roar::Representer
          # include Doorbell::API::V1::Presenters::PaginatedPresenter

          collection :to_a, extend: TeamPresenter, as: :teams, embedded: true
        end
      end
    end
  end
end
