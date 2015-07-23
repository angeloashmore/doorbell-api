module Doorbell
  module Mutation
    module Users
      class View < Mutations::Command
        optional do
          integer :id
          model :user
          string :email
        end

        def execute
          users = ROM.env.relation(:users).as(:entity)
          teams = ROM.env.relation(:teams).as(:entity)

          if id_present?
            user_ = users.by_id(id)
            return user_.one
          end

          if email_present?
            user_ = users.by_email(email)
            return user_.one
          end

          if user_present?
            teams = teams.for_user(user)
            users = users.for_teams(teams)
            return users.to_a
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
