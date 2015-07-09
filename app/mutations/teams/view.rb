module Doorbell
  module Mutation
    module Teams
      class View < Mutations::Command
        optional do
          integer :id
          model :user
        end

        def execute
          if id_present?
            relation = ROM.env.relation(:teams).as(:entity).for_id(id)
            return relation.one
          end

          if user_present?
            relation = ROM.env.relation(:teams).as(:entity).for_user(user.id)
            return relation.to_a
          end
        end
      end
    end
  end
end
