class WebHooksPullRequestUpdater < ApplicationJob
  queue_as :default

  def perform(pr)
    Adapters::GitHubWrapper.new.create_or_update_from_webhook(pr)
  end
end
