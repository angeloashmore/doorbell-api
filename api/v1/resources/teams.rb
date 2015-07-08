module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do
          desc 'Return all teams.'
          get do
            validate_token!

            teams = rom.relation(:teams)
            present teams.as(:entity).to_a, with: Doorbell::API::V1::Presenters::TeamsPresenter
          end

          desc 'Create a team.'
          params do
            requires :name, type: String, allow_blank: false
            requires :email, type: String, allow_blank: false
          end
          post do
            validate_token!

            create_team = rom.command(:teams).as(:entity).create
            create_role = rom.command(:roles).create

            team = nil
            create_team.transaction do
              team = create_team.call(declared_params)
              role = create_role.call(user_id: current_user_id,
                                      resource_type: "team",
                                      resource_id: team.id,
                                      name: "admin")
            end

            present team, with: Doorbell::API::V1::Presenters::TeamPresenter
          end
        end
      end
    end
  end
end
