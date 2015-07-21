module Doorbell
  module Mutation
    module Profiles
      class Create < Mutations::Command
        required do
          model :user
          model :team
          boolean :private, default: false
        end

        optional do
          string :email, match: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          command = ROM.env.command(:profiles).as(:entity).create

          command.transaction do
            @profile = command.call(user_id: user.id,
                                    team_id: team.id,
                                    email: email || user.email,
                                    private: inputs[:private])
          end

          @profile
        end
      end
    end
  end
end
