module Doorbell
  module Mutation
    module Profiles
      class Create < Mutations::Command
        required do
          model :user
          model :team
          boolean :private, default: false
        end

        def execute
          command = ROM.env.command(:profiles).as(:entity).create

          command.transaction do
            @profile = command.call(user_id: user.id,
                                    team_id: team.id,
                                    private: inputs[:private])
          end

          @profile
        end
      end
    end
  end
end
