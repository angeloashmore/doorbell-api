module Doorbell
  module API
    module V1
      module Presenters
        module UserPresenter
          include Roar::JSON
          include Grape::Roar::Representer

          property :id

          property :remote_id

          property :email

          property :created_at
          property :updated_at
        end
      end
    end
  end
end
