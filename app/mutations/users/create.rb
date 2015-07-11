module Doorbell
  module Mutation
    module Users
      class Create < Mutations::Command
        required do
          string :remote_id
          string :email, match: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          command = ROM.env.command(:users).as(:entity).create

          command.transaction do
            @user = command.call(inputs)
            Doorbell::Mutation::Billings::Create.run!(user: @user)
          end

          @user
        end
      end
    end
  end
end
