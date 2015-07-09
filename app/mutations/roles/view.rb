module Doorbell
  module Mutation
    module Roles
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          roles = ROM.env.relation(:roles).as(:entity)

          if id_present?
            role = roles.by_id(id)
            return role.one
          end

          if user_present?
            roles = roles.for_user(user)
            return roles.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
