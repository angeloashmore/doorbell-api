module Doorbell
  module Mutation
    module Teams
      class Create < Mutations::Command
        required do
          model :user
          string :name
          string :email, match: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          command = ROM.env.command(:teams).as(:entity).create

          begin
            @team = command.call(inputs.except(:user))

            Doorbell::Mutation::TeamMembers::Create.run!(team: @team,
                                                         user: user,
                                                         roles: { owner: true })

            Doorbell::Mutation::Billings::Create.run!(team: @team)
          end

          View.run!(id: @team.id)
        end
      end
    end
  end
end
