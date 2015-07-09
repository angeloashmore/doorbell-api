module Doorbell
  module Mutation
    module Teams
      class Update < Mutations::Command
        optional do
          model :team
          string :name
          string :email
        end

        def execute
          update_team = ROM.env.command(:teams).as(:entity).update.by_id(team.id)

          update_team.transaction do
            @team = update_team.call(inputs.except(:team))
          end

          @team
        end
      end
    end
  end
end
