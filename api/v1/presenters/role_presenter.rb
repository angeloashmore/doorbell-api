module Doorbell
  module API
    module V1
      module Presenters
        module RolePresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :team_id
          property :user_id
          property :name

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
