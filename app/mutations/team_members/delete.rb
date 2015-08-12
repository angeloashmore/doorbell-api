module Doorbell
  module Mutation
    module TeamMembers
      class Delete < Mutations::Command
        required do
          model :team_member
        end

        def execute
          command = ROM.env.command(:team_members).delete.by_id(team_member.id)

          begin
            command.call
          end

          team_member
        end
      end
    end
  end
end
