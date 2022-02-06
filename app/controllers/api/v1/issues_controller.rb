module Api
  module V1
    class IssuesController < BaseController
      # include ApiAccessible

      def create
        Issue.transaction(requires_new: true) do
          byebug
          data_hash = JSON.parse(payload)
          pp data_hash
          byebug
          issue = Issue.find_or_create_by!(number: issue_number)
          issue.events.create!(:action, :sender, :repository, :organization, :installation, :issue_id)
        end

        render nothing: true, status: :created
      end

      private

      def issue_number
        params[:issue][:number]
      end

      def payload
        params.except(:issue)
      end
    end
  end
end
