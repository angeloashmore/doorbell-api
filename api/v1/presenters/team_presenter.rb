module Doorbell
  module API
    module V1
      module Presenters
        module TeamPresenter
          include Roar::JSON::HAL
          include Roar::Hypermedia
          include Grape::Roar::Representer

          property :id, writable: false, type: String, desc: 'Team unique ID.'

          property :name, type: String, desc: 'Team name.'
          property :email, type: String, desc: 'Team email.'

          property :created_at, type: DateTime, desc: 'Team created at datetime.'
          property :updated_at, type: DateTime, desc: 'Team created at datetime.'
        end
      end
    end
  end
end
