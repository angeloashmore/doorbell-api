module Doorbell
  module API
    module V1
      module Presenters
        module TeamsPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: TeamPresenter, as: :teams
        end
      end
    end
  end
end
