module Doorbell
  module Mutation
    module Billings
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          billings = ROM.env.relation(:billings).as(:entity)

          if id_present?
            billing = billings.by_id(id)
            return billing.one
          end

          if user_present?
            for_user = billings.for_type(:user).for_relation(user).as(:entity)
            for_teams = billings.for_teams_accessible_by_user(user).as(:entity)
            return for_user.to_a + for_teams.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
