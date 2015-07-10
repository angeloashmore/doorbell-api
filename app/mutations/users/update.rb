module Doorbell
  module Mutation
    module Users
      class Update < Mutations::Command
        required do
          model :user
        end

        optional do
          string :name
          string :email, matches: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          command = ROM.env.command(:users).as(:entity).update.by_id(user.id)

          command.transaction do
            self.user = command.call(inputs.except(:user))
          end

          user
        end
      end
    end
  end
end
