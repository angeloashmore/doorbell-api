module Doorbell
  module Mutation
    module Teams
      class Delete < Mutations::Command
        required do
          model :team
        end

        def execute
          delete_team = ROM.env.command(:teams).as(:entity).delete.by_id(team.id)

          delete_team.transaction do
            @team = delete_team.call
          end

          @team
        end
      end
    end
  end
end
