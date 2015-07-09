module Doorbell
  module Mutation
    module Profiles
      class Update < Mutations::Command
        required do
          model :profile
        end

        optional do
          string :title
          boolean :private
        end

        def execute
          command = ROM.env.command(:profiles).as(:entity).update.by_id(profile.id)

          command.transaction do
            self.profile = command.call(inputs.except(:profile))
          end

          profile
        end
      end
    end
  end
end
