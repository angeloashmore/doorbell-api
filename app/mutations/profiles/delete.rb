module Doorbell
  module Mutation
    module Profiles
      class Delete < Mutations::Command
        required do
          model :profile
        end

        def execute
          command = ROM.env.command(:profiles).as(:entity).delete.by_id(profile.id)

          command.transaction { command.call }

          profile
        end
      end
    end
  end
end
