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
          teams = ROM.env.relation(:teams).as(:entity)

          if id_present?
            profile = profiles.by_id(id)
            return profile.one
          end

          if user_present?
            teams = teams.for_user(user)
            profiles = profiles.for_teams(teams)
            return profiles.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
