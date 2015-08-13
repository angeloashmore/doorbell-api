module Doorbell
  module Mutation
    module Teams
      class View < Mutations::Command
        optional do
          string :id
        end

        def execute
          teams = ROM.env.relation(:teams).as(:entity)
          teams.by_id(id).one!
        end
      end
    end
  end
end
