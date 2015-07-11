module Doorbell
  module Mutation
    module Users
      class View < Mutations::Command
        optional do
          integer :id
        end

        def execute
          users = ROM.env.relation(:users).as(:entity)

          if id_present?
            user = users.by_id(id)
            return user.one
          end

          return users.to_a
        end
      end
    end
  end
end
