module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do
          desc 'Return all teams.'
          get do
            validate_token!

            teams = rom.relation(:teams).as(:entity).for_user(current_user_id)
            present teams.to_a, with: Doorbell::API::V1::Presenters::TeamsPresenter
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

            create_team.transaction do
              @team = create_team.call(declared_params)
              create_role.call(team_id: @team.id,
                               user_id: current_user_id,
                               name: "owner")
            end

            present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
          end

          route_param :id do
            desc 'Return a team.'
            get do
              validate_token!

              @team = rom.relation(:teams).as(:entity).by_id(params[:id])

              present @team.one, with: Doorbell::API::V1::Presenters::TeamPresenter
            end

            desc 'Update a team.'
            params do
              optional :name, type: String, allow_blank: false
              optional :email, type: String, allow_blank: false
            end
            put do
              validate_token!

              update_team = rom.command(:teams).as(:entity).update.by_id(params[:id])

              update_team.transaction do
                @team = update_team.call(declared_params)
              end

              present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
            end

            desc 'Delete a team.'
            delete do
              validate_token!

              delete_team = rom.command(:teams).as(:entity).delete.by_id(params[:id])
              delete_roles = rom.command(:roles).delete.for_team(params[:id])

              delete_team.transaction do
                @team = delete_team.call
                delete_roles.call
              end

              present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
            end
          end
        end
      end
    end
  end
end
