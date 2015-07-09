module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do
          desc 'Return all teams for current user.'
          get do
            validate_token!
            teams = rom.relation(:teams).as(:entity).for_user(current_user.id)
            present teams.to_a, with: Doorbell::API::V1::Presenters::TeamsPresenter
          end

          desc 'Create a team.'
          params do
            requires :name, type: String, allow_blank: false
            requires :email, type: String, allow_blank: false
          end
          post do
            validate_token!
            enforce_create_permission(Team.new)

            create_team = rom.command(:teams).as(:entity).create
            create_role = rom.command(:roles).create
            create_billing = rom.command(:billing).create
            create_team.transaction do
              @team = create_team.call(declared_params)
              create_role.call(team_id: @team.id,
                               user_id: current_user.id,
                               name: "owner")
              create_billing.call(team_id: @team.id,
                                  plan_id: Plan.default_plan(:team))
            end

            present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
          end

          route_param :id do
            before do
              @team = rom.relation(:teams).as(:entity).by_id(params[:id]).one
            end

            desc 'Return a team.'
            get do
              validate_token!
              enforce_view_permission(@team, 'Can only be viewed by members.')
              present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
            end

            desc 'Update a team.'
            params do
              optional :name, type: String, allow_blank: false
              optional :email, type: String, allow_blank: false
            end
            put do
              validate_token!
              enforce_update_permission(@team, 'Can only be updated by owners and admins.')

              update_team = rom.command(:teams).as(:entity).update.by_id(@team.id)
              update_team.transaction do
                @team = update_team.call(declared_params)
              end

              present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
            end

            desc 'Delete a team.'
            delete do
              validate_token!
              enforce_delete_permission(@team, 'Can only be deleted by owners.')

              delete_team = rom.command(:teams).as(:entity).delete.by_id(params[:id])
              delete_team.transaction do
                @team = delete_team.call
              end

              present @team, with: Doorbell::API::V1::Presenters::TeamPresenter
            end
          end
        end
      end
    end
  end
end
