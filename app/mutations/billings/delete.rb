module Doorbell
  module Mutation
    module Billings
      class Delete < Mutations::Command
        required do
          model :billing
        end

        def execute
          command = ROM.env.command(:billings).delete.by_id(billing.id)

          begin
            command.call
          end

          billing
        end
      end
    end
  end
end
