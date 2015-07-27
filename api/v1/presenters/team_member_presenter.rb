module Doorbell
  module API
    module V1
      module Presenters
        module TeamMemberPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :user_id
          property :team_id

          property :title
          property :email
          property :private

          property :roles_mask

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
