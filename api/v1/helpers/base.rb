module Doorbell
  module API
    module V1
      module Helpers
        module Base
          def rom
            ROM.env
          end
        end
      end
    end
  end
end
