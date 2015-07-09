module Doorbell
  module API
    module V1
      module Presenters
        module ProfilesPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: ProfilePresenter, as: :profiles
        end
      end
    end
  end
end
