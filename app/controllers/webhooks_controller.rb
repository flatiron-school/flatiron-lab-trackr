class WebhooksController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    if params[:zen]
      head :no_content
      return
    else
      pull_request = Adapters::GitHubWrapper.new.create_or_update_pr_from_webhook(params[:pull_request])
      WebHooksPullRequestUpdaterJob.perform_later(pull_request)
    end
  end
end

