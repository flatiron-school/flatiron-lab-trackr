class PullRequestFetcherJob < ApplicationJob
  queue_as :default

  def perform(lab_id)
    Adapters::GitHubWrapper.new.get_lab_prs(lab_id)
  end
end
