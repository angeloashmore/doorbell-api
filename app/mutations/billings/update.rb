module Doorbell
  module Mutation
    module Billings
      class Update < Mutations::Command
        required do
          model :billing
        end

        optional do
          string :email, matches: EmailRegex::EMAIL_ADDRESS_REGEX
          string :brand
          string :last4
          string :exp_month
          string :exp_year
        end

        def execute
          command = ROM.env.command(:billings).as(:entity).update.by_id(billing.id)

          command.transaction do
            self.billing = command.call(inputs.except(:billing))
          end

          billing
        end
      end
    end
  end
end
