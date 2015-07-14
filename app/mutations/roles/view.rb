module Doorbell
  module Mutation
    module Roles
      class View < Mutations::Command
        optional do
          integer :id
          model :user
          boolean :all_accessible_for_user
        end

        def execute
          roles = ROM.env.relation(:roles).as(:entity)
          teams = ROM.env.relation(:teams).as(:entity)

          if id_present?
            role = roles.by_id(id)
            return role.one
          end

          if user_present?
            if all_accessible_for_user
              teams = teams.for_user(user).to_a
              p teams.to_a
              roles = roles.for_teams(teams)
              p roles.to_a
            else
              roles = roles.for_user(user)
            end

            return roles.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
