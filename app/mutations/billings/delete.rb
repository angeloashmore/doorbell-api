module Doorbell
  module Mutation
    module Billings
      class Delete < Mutations::Command
        required do
          model :billing
        end

        def execute
          command = ROM.env.command(:billings).delete.by_id(billing.id)

          command.transaction { command.call }

          billing
        end
      end
    end
  end
end
