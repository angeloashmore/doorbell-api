module Doorbell
  module Mutation
    module Billings
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          billings = ROM.env.relation(:billings).as(:entity)

          if id_present?
            billing = billigns.by_id(id)
            return billing.one
          end

          if user_present?
            billings = billings.for_type(:user).for_relation(user)
            return billings.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
