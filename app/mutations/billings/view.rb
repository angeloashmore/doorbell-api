module Doorbell
  module Mutation
    module Billings
      class View < Mutations::Command
        optional do
          string :id
        end

        def execute
          billings = ROM.env.relation(:billings).as(:entity)
          billings.by_id(id).one!
        end
      end
    end
  end
end
