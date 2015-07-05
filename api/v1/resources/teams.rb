module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do

          desc "Return a all teams."
          get do
            ROM.env.relation(:teams).to_a
          end

          desc "Create a team."
          post do
            result = ROM.env.command(:teams).try do
              ROM.env.command(:teams).create.call(params)
            end
            status 201
            result.value
          end

        end
      end
    end
  end
end
