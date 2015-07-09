module Doorbell
  module Mutation
    module Teams
      class Create < Mutations::Command
        required do
          model :user
          string :name
          string :email
        end

        def execute
          create_team = ROM.env.command(:teams).as(:entity).create
          create_role = ROM.env.command(:roles).create
          create_billing = ROM.env.command(:billings).create

          create_team.transaction do
            @team = create_team.call(inputs.except(:user))

            create_role.call(team_id: @team.id,
                             user_id: user.id,
                             name: "owner")

            create_billing.call(team_id: @team.id,
                                plan_id: Plan.default_plan(:team),
                                stripe_customer_id: "123")
          end

          @team
        end
      end
    end
  end
end
