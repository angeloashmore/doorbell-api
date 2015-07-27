module Doorbell
  module Mutation
    module TeamMembers
      class Create < Mutations::Command
        required do
          model :user
          model :team
          boolean :private, default: false
          hash :roles do
            boolean :*
          end
        end

        optional do
          string :title
          string :email, match: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          command = ROM.env.command(:team_members).as(:entity).create

          roles_mask = Bitmask.new(TeamMember.roles, roles.deep_symbolize_keys).to_i
          team_member = TeamMember.new(user_id: user.id,
                                       team_id: team.id,
                                       title: title,
                                       email: email || user.email,
                                       roles_mask: roles_mask,
                                       private: inputs[:private])

          command.transaction do
            @team_member = command.call(team_member.to_h.except(:id))
          end

          @team_member
        end
      end
    end
  end
end
