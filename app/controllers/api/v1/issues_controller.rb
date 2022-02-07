module Api
  module V1
    class IssuesController < BaseController
      # include ApiAccessible

      def create
        Issue.transaction(requires_new: true) do
          #test ngrok
          issue = Issue.find_or_create_by!(number: issue_number)
          issue.events.create!(
            repository: repository_params,
            sender: sender_params,
            action: params[:action]
          )
        end

        render nothing: true, status: :created
      end

      private

      def issue_number
        params[:issue][:number]
      end

      def repository_params
        params.require(:repository)
      end

      def sender_params
        params.require(:sender)
      end
    end
  end
end
