module Doorbell
  module Mutation
    module Users
      class View < Mutations::Command
        optional do
          integer :id
          string :email
        end

        def execute
          users = ROM.env.relation(:users).as(:entity)

          if id_present?
            return users.by_id(id).one!
          end

          if email_present?
            return users.by_email(email).one!
          end

          fail Mutations::ValidationException
        end
      end
    end
  end
end
