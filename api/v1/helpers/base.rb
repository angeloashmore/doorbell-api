module Doorbell
  module API
    module V1
      module Helpers
        module Base
          def rom
            ROM.env
          end

          def declared_params
            @declared_params ||= declared(params, include_missing: false)
          end
        end
      end
    end
  end
end
