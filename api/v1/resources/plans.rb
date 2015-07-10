module Doorbell
  module API
    module V1
      class Plans < Grape::API
        resource :plans do
          before do
            validate_token!
          end

          desc 'Return all plans.'
          get do
            plans = Mutation::Plans::View.run!
            present plans, with: Presenters::PlansPresenter
          end

          route_param :id do
            before do
              @plan = Mutation::Plans::View.run!(id: params[:id])
            end

            desc 'Return a plan.'
            get do
              enforce_view_permission(@plan)
              present @plan, with: Presenters::PlanPresenter
            end
          end
        end
      end
    end
  end
end
