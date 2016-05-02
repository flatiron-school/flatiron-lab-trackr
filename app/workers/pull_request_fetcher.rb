class PullRequestFetcher
  include Sidekiq::Worker

  def perform(lab_id)
    Adapters::GitHubWrapper.new.get_lab_prs(lab_id)
  end
end
