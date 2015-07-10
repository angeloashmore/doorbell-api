module Doorbell
  module API
    module V1
      module Presenters
        module PlansPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: PlanPresenter, as: :plans
        end
      end
    end
  end
end
