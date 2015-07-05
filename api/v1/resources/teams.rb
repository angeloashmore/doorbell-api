module Doorbell
  module API
    module V1
      class Teams < Grape::API
        resource :teams do
          desc 'Return all teams.'
          get do
            rom.relation(:teams).to_a
          end

          desc 'Create a team.'
          post do
            result = rom.command(:teams).try do
              rom.command(:teams).create.call(params)
            end
            status 201
            result.value
          end
        end
      end
    end
  end
end
