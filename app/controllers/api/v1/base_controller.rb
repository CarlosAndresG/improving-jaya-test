module Api
  module V1
    class BaseController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :render404

      before_action :set_default_response_format

      def set_default_response_format
        request.format = :json
      end

      def render404
        render json: {}, status: :not_found
      end
    end
  end
end