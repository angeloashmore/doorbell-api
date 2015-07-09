module Doorbell
  module Mutation
    module Roles
      class Delete < Mutations::Command
        required do
          model :role
        end

        def execute
          command = ROM.env.command(:roles).delete.by_id(role.id)

          command.transaction { command.call }

          role
        end
      end
    end
  end
end
