module Doorbell
  module API
    module V1
      module Presenters
        module ProfilePresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :user_id
          property :team_id

          property :title
          property :email
          property :private

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
