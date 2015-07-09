module Doorbell
  module Mutation
    module Teams
      class Create < Mutations::Command
        required do
          model :user
          model :plan, default: Plan.default_for(:team)
          string :name
          string :email
        end

        def execute
          create_team = ROM.env.command(:teams).as(:entity).create
          create_billing = ROM.env.command(:billings).create

          create_team.transaction do
            @team = create_team.call(inputs.except(:user, :plan))

            Doorbell::Mutation::Roles::Create.run!(team: @team,
                                                   user: user,
                                                   name: 'owner')

            create_billing.call(team_id: @team.id,
                                plan_id: plan.id,
                                stripe_customer_id: "123")

            Doorbell::Mutation::Profiles::Create.run!(team: @team,
                                                      user: user)
          end

          View.run!(id: @team.id)
        end
      end
    end
  end
end
