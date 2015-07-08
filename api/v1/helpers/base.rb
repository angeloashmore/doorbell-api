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

          def validate_token
            begin
              auth0_client_id = ENV['AUTH0_CLIENT_ID']
              auth0_client_secret = ENV['AUTH0_CLIENT_SECRET']
              authorization = request.headers['Authorization']
              fail InvalidTokenError if authorization.nil?

              token = request.headers['Authorization'].split(' ').last
              decoded_token = JWT.decode(token,
                                         JWT.base64url_decode(auth0_client_secret))

              fail InvalidTokenError if auth0_client_id != decoded_token[0]["aud"]

              @token = decoded_token
            rescue JWT::DecodeError
              raise InvalidTokenError
            end
          end

          def current_user
            p @token
          end
        end
      end
    end
  end
end
