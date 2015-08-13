module Doorbell
  module Mutation
    module TeamMembers
      class View < Mutations::Command
        optional do
          string :id
        end

        def execute
          team_members = ROM.env.relation(:team_members).as(:entity)
          team_members.by_id(id).one!
        end
      end
    end
  end
end
