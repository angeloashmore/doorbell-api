module Doorbell
  module Mutation
    module Users
      class Delete < Mutations::Command
        required do
          model :user
        end

        def execute
          command = ROM.env.command(:users).delete.by_id(user.id)

          command.transaction { command.call }

          user
        end
      end
    end
  end
end
