module Doorbell
  module API
    module V1
      module Presenters
        module BillingsPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          collection :to_a, extend: BillingPresenter, as: :billings
        end
      end
    end
  end
end
