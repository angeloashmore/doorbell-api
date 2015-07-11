module Doorbell
  module API
    module V1
      class Users < Grape::API
        resource :users do
          desc 'Return all users.'
          get do
            validate_token!
            users = Mutation::Users::View.run!
            present users, with: Presenters::UsersPresenter
          end

          desc 'Create a user.'
          post do
            validate_token!(client_id: ENV['DOORBELL_CLIENT_ID'],
                            client_secret: ENV['DOORBELL_CLIENT_SECRET'])
            args = { remote_id: @token['user_id'], email: @token['email'] }
            user = Mutation::Users::Create.run!(args)
            present user, with: Presenters::UserPresenter
          end

          route_param :id do
            before do
              @user = Mutation::Users::View.run!(id: params[:id])
            end

            desc 'Return a user.'
            get do
              validate_token!
              enforce_view_permission(@user)
              present @user, with: Presenters::UserPresenter
            end

            desc 'Update a user.'
            put do
              validate_token!(client_id: ENV['DOORBELL_CLIENT_ID'],
                              client_secret: ENV['DOORBELL_CLIENT_SECRET'])
              enforce_update_permission(@user, 'Can only be updated by itself.')
              user = Mutation::Users::Update.run!(params.to_h.merge(user: @user))
              present user, with: Presenters::UserPresenter
            end
          end
        end
      end
    end
  end
end
