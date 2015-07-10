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

          command.transaction do
            @team = command.call(inputs.except(:user))

            Doorbell::Mutation::Roles::Create.run!(team: @team,
                                                   user: user,
                                                   name: 'owner')

            Doorbell::Mutation::Billings::Create.run!(team: @team)

            Doorbell::Mutation::Profiles::Create.run!(team: @team,
                                                      user: user)
          end

          View.run!(id: @team.id)
        end
      end
    end
  end
end
