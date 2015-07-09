module Doorbell
  module Mutation
    module Roles
      class Update < Mutations::Command
        required do
          model :role
        end

        optional do
          string :name, in: Role.names
        end

        def execute
          command = ROM.env.command(:roles).as(:entity).update.by_id(role.id)

          command.transaction do
            self.role = command.call(inputs.except(:role))
          end

          role
        end
      end
    end
  end
end
