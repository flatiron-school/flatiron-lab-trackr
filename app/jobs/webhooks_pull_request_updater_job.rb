class WebHooksPullRequestUpdaterJob < ApplicationJob
  queue_as :default

  def perform(pr)
    Adapters::GitHubWrapper.new.update_pr_files_from_webhook(pr)
  end
end
