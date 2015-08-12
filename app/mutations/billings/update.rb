module Doorbell
  module Mutation
    module Billings
      class Update < Mutations::Command
        required do
          model :billing
        end

        optional do
          string :email, matches: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          command = ROM.env.command(:billings).as(:entity).update.by_id(billing.id)

          begin
            self.billing = command.call(inputs.except(:billing))
          end

          billing
        end
      end
    end
  end
end
