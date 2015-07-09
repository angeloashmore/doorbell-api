module Doorbell
  module API
    module V1
      module Helpers
        module Base
          def validate_token!
            begin
              auth0_client_id = ENV['AUTH0_CLIENT_ID']
              auth0_client_secret = ENV['AUTH0_CLIENT_SECRET']
              authorization = request.headers['Authorization']
              fail InvalidTokenError if authorization.nil?

              token = request.headers['Authorization'].split(' ').last
              decoded_token = JWT.decode(token,
                                         JWT.base64url_decode(auth0_client_secret))

              fail InvalidTokenError if auth0_client_id != decoded_token[0]['aud']

              @token = decoded_token.first
            rescue JWT::DecodeError
              raise InvalidTokenError
            end
          end

          def current_user_id
            return @current_user_id unless @current_user_id.nil?

            fail NoTokenError if !@token
            current_user_id = @token['sub']
            fail InvalidTokenError if current_user_id.nil?
            @current_user_id = current_user_id
          end

          def current_user
            @current_user ||= User.new(id: current_user_id)
          end
        end
      end
    end
  end
end
