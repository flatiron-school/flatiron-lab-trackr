module Adapters
  class GitHubWrapper

    attr_accessor :client

    def initialize
      configure_client
    end

    def get_repo_create_date(lab)
      repo_name = lab.repo.split("/").last
      repo_data = client.repository("learn-co-students/#{repo_name}")
      repo_data.created_at
    end


    private

      def configure_client
        @client ||= Octokit::Client.new(:access_token => ENV['OCTO_TOKEN'])
      end
  end
end
