module Doorbell
  module Mutation
    module Teams
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          teams = ROM.env.relation(:teams).as(:entity_with_roles)
          roles = ROM.env.relation(:roles)

          if id_present?
            team = teams.by_id(id).combine(roles.for_team)
            return team.one
          end

          if user_present?
            teams = teams.for_user(user).combine(roles.for_teams)
            return teams.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
