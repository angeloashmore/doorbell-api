module Doorbell
  module API
    module V1
      class Roles < Grape::API
        resource :roles do
          before do
            validate_token!
          end

          desc 'Return all roles for current user.'
          get do
            roles = Mutation::Roles::View.run!(user: current_user, all_accessible_for_user: true)
            present roles, with: Presenters::RolesPresenter
          end

          desc 'Create a role.'
          post do
            enforce_create_permission(Role.new(team_id: params[:team_id]), 'Can only be created by team owner or admin.')
            args = {
              team: Team.new(id: params[:team_id]),
              user: Mutation::Users::View.run!(email: params[:email]),
              name: "member"
            }
            role = Mutation::Roles::Create.run!(args)
            present role, with: Presenters::RolePresenter
          end

          route_param :id do
            before do
              @role = Mutation::Roles::View.run!(id: params[:id])
            end

            desc 'Return a role.'
            get do
              enforce_view_permission(@role, 'Can only be viewed by owner or team member.')
              present @role, with: Presenters::RolePresenter
            end

            desc 'Update a role.'
            put do
              enforce_update_permission(@role, 'Can only be updated by owner.')
              role = Mutation::Roles::Update.run!(params.to_h.merge(role: @role))
              present role, with: Presenters::RolePresenter
            end

            desc 'Delete a role.'
            delete do
              enforce_delete_permission(@role, 'Can only be deleted by owners.')
              role = Mutation::Roles::Delete.run!(role: @role)
              present role, with: Presenters::RolePresenter
            end
          end
        end
      end
    end
  end
end
