module Doorbell
  module Mutation
    module TeamMembers
      class Update < Mutations::Command
        required do
          model :team_member
        end

        optional do
          string :title
          boolean :private
          hash :roles do
            boolean :*
          end
        end

        def execute
          command = ROM.env.command(:team_members).as(:entity).update.by_id(team_member.id)

          roles_mask = Bitmask.new(TeamMember.roles, roles).to_i
          command.transaction do
            self.team_member = command.call(inputs.except(:team_member).merge(roles_mask: roles_mask))
          end

          team_member
        end
      end
    end
  end
end
