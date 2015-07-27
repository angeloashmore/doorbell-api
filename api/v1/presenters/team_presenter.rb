module Doorbell
  module API
    module V1
      module Presenters
        module TeamPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :name
          property :email

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
