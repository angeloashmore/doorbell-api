module Doorbell
  module Mutation
    module TeamMembers
      class View < Mutations::Command
        optional do
          integer :id
          model :user
          boolean :all_accessible_for_user
        end

        def execute
          team_members = ROM.env.relation(:team_members).as(:entity)
          teams = ROM.env.relation(:teams).as(:entity)

          if id_present?
            team_member = team_members.by_id(id)
            return team_member.one
          end

          if user_present?
            if all_accessible_for_user
              teams = teams.for_user(user).to_a
              team_members = team_members.for_teams(teams)
            else
              team_members = team_members.for_user(user)
            end

            return team_members.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
