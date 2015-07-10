module Doorbell
  module API
    module V1
      class Billings < Grape::API
        resource :billings do
          before do
            validate_token!
          end

          desc 'Return all billings for current user.'
          get do
            billings = Mutation::Billings::View.run!(user: current_user)
            present billings, with: Presenters::BillingsPresenter
          end

          route_param :id do
            before do
              @billing = Mutation::Billings::View.run!(id: params[:id])
            end

            desc 'Return a billing.'
            get do
              enforce_view_permission(@billing, 'Can only be viewed by owner or team member.')
              present @billing, with: Presenters::BillingPresenter
            end

            desc 'Update a billing.'
            put do
              enforce_update_permission(@billing, 'Can only be updated by owner.')
              billing = Mutation::Billings::Update.run!(params.to_h.merge(billing: @billing))
              present billing, with: Presenters::BillingPresenter
            end
          end
        end
      end
    end
  end
end
