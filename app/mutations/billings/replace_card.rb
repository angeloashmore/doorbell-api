module Doorbell
  module Mutation
    module Billings
      class ReplaceCard < Mutations::Command
        required do
          model :billing
          string :stripe_token
        end

        def execute
          command = ROM.env.command(:billings).as(:entity).update.by_id(billing.id)

          begin
            customer = Stripe::Customer.retrieve(billing.stripe_customer_id)
            customer.source = stripe_token
            customer.save

            source = customer.sources.data.first

            self.billing = command.call(brand: source.brand,
                                        last4: source.last4,
                                        exp_month: source.exp_month,
                                        exp_year: source.exp_year)
          end

          billing
        end
      end
    end
  end
end
