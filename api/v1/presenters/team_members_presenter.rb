module Doorbell
  module API
    module V1
      module Presenters
        module TeamMembersPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: TeamMemberPresenter, as: :team_members
        end
      end
    end
  end
end
