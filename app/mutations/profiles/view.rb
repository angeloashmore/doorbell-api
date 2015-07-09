module Doorbell
  module Mutation
    module Profiles
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          profiles = ROM.env.relation(:profiles).as(:entity)

          if id_present?
            profile = profiles.by_id(id)
            return profile.one
          end

          if user_present?
            profiles = profiles.for_user(user)
            return profiles.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
