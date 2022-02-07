module Api
  module V1
    class EventsController < BaseController
      # before_action :authenticate_user!

      def index
        issue = Issue.includes(:events).find_by!(number: number)
        # render json: issue.events.paginate(page: params[:page]).order('id DESC')
        render json: issue.events
      end

      private

      def number
        params[:issue_id]
      end
    end
  end
end