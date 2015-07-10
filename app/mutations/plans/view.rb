module Doorbell
  module Mutation
    module Plans
      class View < Mutations::Command
        optional do
          integer :id
        end

        def execute
          plans = ROM.env.relation(:plans).as(:entity)

          if id_present?
            plan = plans.by_id(id)
            return plan.one
          end

          return plans.to_a
        end
      end
    end
  end
end
