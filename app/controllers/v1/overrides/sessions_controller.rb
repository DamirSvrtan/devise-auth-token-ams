module V1
  module Overrides
    class SessionsController < DeviseTokenAuth::SessionsController
      include JsonApiResponders
      include ParamsDeserialization

      def render_create_success
        respond_with @resource, serializer: V1::UserSerializer
      end

      def render_create_error_bad_credentials
        respond_with_error(401, I18n.t("devise_token_auth.sessions.bad_credentials"))
      end

      private

      def resource_params
        deserialized_params.permit(:email, :password)
      end
    end
  end
end
