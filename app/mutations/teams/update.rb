module Doorbell
  module Mutation
    module Teams
      class Update < Mutations::Command
        required do
          model :team
        end

        optional do
          string :name
          string :email
        end

        def execute
          command = ROM.env.command(:teams).as(:entity).update.by_id(team.id)

          command.transaction { command.call(inputs.except(:team)) }

          View.run!(id: team.id)
        end
      end
    end
  end
end
