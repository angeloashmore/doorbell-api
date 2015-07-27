module Doorbell
  module API
    module V1
      class TeamMembers < Grape::API
        resource :team_members do
          before do
            validate_token!
          end

          desc 'Return all team members for current user.'
          get do
            p current_user
            team_members = Mutation::TeamMembers::View.run!(user: current_user, all_accessible_for_user: true)
            present team_members, with: Presenters::TeamMembersPresenter
          end

          desc 'Create a team member.'
          post do
            enforce_create_permission(TeamMember.new(team_id: params[:team_id]), 'Can only be created by team owner or admin.')
            args = {
              team: Team.new(id: params[:team_id]),
              user: Mutation::Users::View.run!(email: params[:email])
            }
            team_member = Mutation::TeamMembers::Create.run!(params.to_h.merge(args))
            present team_member, with: Presenters::TeamMemberPresenter
          end

          route_param :id do
            before do
              @team_member = Mutation::TeamMembers::View.run!(id: params[:id])
            end

            desc 'Return a team member.'
            get do
              enforce_view_permission(@team_member, 'Can only be viewed by owner or team member.')
              present @team_member, with: Presenters::TeamMemberPresenter
            end

            desc 'Update a team member.'
            put do
              enforce_update_permission(@team_member, 'Can only be updated by owner.')
              team_member = Mutation::TeamMembers::Update.run!(params.to_h.merge(team_member: @team_member))
              present team_member, with: Presenters::TeamMemberPresenter
            end

            desc 'Delete a team member.'
            delete do
              enforce_delete_permission(@team_member, 'Can only be deleted by owners.')
              team_member = Mutation::TeamMembers::Delete.run!(team_member: @team_member)
              present team_member, with: Presenters::TeamMemberPresenter
            end
          end
        end
      end
    end
  end
end
