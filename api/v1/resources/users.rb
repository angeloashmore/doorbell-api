module Doorbell
  module API
    module V1
      class Users < Grape::API
        resource :users do
          before do
            validate_token!
          end

          desc 'Return all users.'
          get do
            users = Mutation::Users::View.run!
            present users, with: Presenters::UsersPresenter
          end

          desc 'Create a user.'
          post do
            enforce_create_permission(User.new)
            user = Mutation::Users::Create.run!(params.to_h)
            present user, with: Presenters::UserPresenter
          end

          route_param :id do
            before do
              @user = Mutation::Users::View.run!(id: params[:id])
            end

            desc 'Return a user.'
            get do
              enforce_view_permission(@user)
              present @user, with: Presenters::UserPresenter
            end

            desc 'Update a user.'
            put do
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
