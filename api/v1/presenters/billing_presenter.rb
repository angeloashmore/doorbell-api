module Doorbell
  module API
    module V1
      module Presenters
        module BillingsPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :plan_id

          property :relation_type
          property :relation_id

          property :stripe_customer_id
          property :email

          property :brand
          property :last4
          property :exp_month
          property :exp_year

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
