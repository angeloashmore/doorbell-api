module Doorbell
  module Mutation
    module Teams
      class Delete < Mutations::Command
        required do
          model :team
        end

        def execute
          billing = ROM.env.relation(:billings).for_type(:team).for_relation(team).as(:entity).one
          command = ROM.env.command(:teams).delete.by_id(team.id)

          command.transaction do
            command.call
            Doorbell::Mutation::Billings::Delete.run!(billing: billing)
          end

          team
        end
      end
    end
  end
end
