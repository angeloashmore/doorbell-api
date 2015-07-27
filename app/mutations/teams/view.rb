module Doorbell
  module Mutation
    module Teams
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          teams = ROM.env.relation(:teams).as(:entity)

          if id_present?
            team = teams.by_id(id)
            return team.one
          end

          if user_present?
            teams = teams.for_user(user)
            return teams.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
