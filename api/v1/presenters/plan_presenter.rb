module Doorbell
  module API
    module V1
      module Presenters
        module PlanPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :name
          property :type

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
