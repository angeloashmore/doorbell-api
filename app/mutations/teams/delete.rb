module Doorbell
  module Mutation
    module Teams
      class Delete < Mutations::Command
        required do
          model :team
        end

        def execute
          command = ROM.env.command(:teams).delete.by_id(team.id)

          command.transaction { command.call }

          team
        end
      end
    end
  end
end
