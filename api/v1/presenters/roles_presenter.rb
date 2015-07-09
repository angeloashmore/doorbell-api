module Doorbell
  module API
    module V1
      module Presenters
        module RolesPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: RolePresenter, as: :roles
        end
      end
    end
  end
end
