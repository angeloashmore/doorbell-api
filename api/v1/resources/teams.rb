module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do
          desc 'Return all teams.'
          get do
            teams = rom.relation(:teams)
            present teams.as(:entity).to_a, with: Doorbell::API::V1::Presenters::TeamsPresenter
          end

          desc 'Create a team.'
          params do
            requires :name, type: String, allow_blank: false
            requires :email, type: String, allow_blank: false
          end
          post do
            create_team = rom.command(:teams).as(:entity).create
            user = create_team.call(declared_params)

            present user, with: Doorbell::API::V1::Presenters::TeamPresenter
          end
        end
      end
    end
  end
end
