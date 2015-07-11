module Doorbell
  module API
    module V1
      module Presenters
        module UsersPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: UserPresenter, as: :users
        end
      end
    end
  end
end
