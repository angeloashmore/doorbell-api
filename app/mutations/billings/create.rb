module Doorbell
  module Mutation
    module Billings
      class Create < Mutations::Command
        optional do
          model :user
          model :team
          model :plan
          string :email, matches: EmailRegex::EMAIL_ADDRESS_REGEX
        end

        def execute
          fail Mutations::ValidationException unless user_present? || team_present?

          relation = user_present? ? user : team
          self.plan ||= Plan.default_for(user_present? ? :user : :team)
          self.email ||= relation.email

          command = ROM.env.command(:billings).as(:entity).create

          command.transaction do
            customer = Stripe::Customer.create(email: email,
                                               plan: plan.stripe_plan_id)

            @billing = command.call(plan_id: plan.id,
                                    email: email,
                                    relation_type: relation.class.to_s.underscore,
                                    relation_id: relation.id,
                                    stripe_customer_id: customer.id)

            customer.metadata = { billing_id: @billing.id }
            customer.save
          end

          return @billing
        end
      end
    end
  end
end
