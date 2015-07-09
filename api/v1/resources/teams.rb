module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do
          before do
            validate_token!
          end

          desc 'Return all teams for current user.'
          get do
            teams = Mutation::Teams::View.run!(user: current_user)
            present teams, with: Presenters::TeamsPresenter
          end

          desc 'Create a team.'
          post do
            args = params.to_h.merge({ user: current_user })
            team = Mutation::Teams::Create.run!(args)
            present team, with: Presenters::TeamPresenter
          end

          route_param :id do
            before do
              @team = Mutation::Teams::View.run!(id: params[:id])
            end

            desc 'Return a team.'
            get do
              enforce_view_permission(@team, 'Can only be viewed by members.')
              present @team, with: Presenters::TeamPresenter
            end

            desc 'Update a team.'
            put do
              enforce_update_permission(@team, 'Can only be updated by owners and admins.')
              args = params.merge({ team: @team })
              team = Mutation::Teams::Update.run!(args)
              present team, with: Presenters::TeamPresenter
            end

            desc 'Delete a team.'
            delete do
              enforce_delete_permission(@team, 'Can only be deleted by owners.')
              team = Mutation::Teams::Delete.run!(team: @team)
              present team, with: Presenters::TeamPresenter
            end
          end
        end
      end
    end
  end
end
