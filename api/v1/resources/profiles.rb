module Doorbell
  module API
    module V1
      class Profiles < Grape::API
        resource :profiles do
          before do
            validate_token!
          end

          desc 'Return all profiles for current user.'
          get do
            profiles = Mutation::Profiles::View.run!(user: current_user)
            present profiles, with: Presenters::ProfilesPresenter
          end

          route_param :id do
            before do
              @profile = Mutation::Profiles::View.run!(id: params[:id])
            end

            desc 'Return a profile.'
            get do
              enforce_view_permission(@profile, 'Can only be viewed by owner or team member.')
              present @profile, with: Presenters::ProfilePresenter
            end

            desc 'Update a profile.'
            put do
              enforce_update_permission(@profile, 'Can only be updated by owner.')
              profile = Mutation::Profiles::Update.run!(params.to_h.merge(profile: @profile))
              present profile, with: Presenters::ProfilePresenter
            end
          end
        end
      end
    end
  end
end
