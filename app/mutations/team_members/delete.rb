module Doorbell
  module Mutation
    module TeamMembers
      class Delete < Mutations::Command
        required do
          model :team_member
        end

        def execute
          command = ROM.env.command(:team_members).delete.by_id(team_member.id)

          command.transaction { command.call }

          team_member
        end
      end
    end
  end
end
