module Adapters
  class GitHubWrapper

    def initialize
      configure_client
    end

    def get_repo_create_date(repo)
      binding.pry
    end


    private

      def configure_client
        @client ||= Octokit::Client.new(:access_token => ENV['OCTO_TOKEN'])
      end
  end
end
