module Doorbell
  module Mutation
    module Roles
      class Create < Mutations::Command
        required do
          model :user
          model :team
          string :name, in: Role.names
        end

        def execute
          command = ROM.env.command(:roles).as(:entity).create

          command.transaction do
            @role = command.call(user_id: user.id,
                                 team_id: team.id,
                                 name: name)

            Doorbell::Mutation::Profiles::Create.run!(team: team,
                                                      user: user)
          end

          @role
        end
      end
    end
  end
end
