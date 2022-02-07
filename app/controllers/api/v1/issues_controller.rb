module Api
  module V1
    class IssuesController < BaseController
      include ApiAccessible

      def create
        Issue.transaction(requires_new: true) do
          #test ngrok
          issue = Issue.find_or_create_by!(number: issue_number) do
             issue = issue_payload
          end
          
          issue.events.create!(
            payload: payload,
            action: action_payload
          )
        end

        render nothing: true, status: :created
      end

      private

      def issue_number
        params[:issue][:number]
      end

      def action_payload
        request.request_parameters['action']
      end

      def issue_payload
        params.require(:issue)
      end

      def payload
        params.except(:issue, :action, :format)
      end


    end
  end
end
