class WebhooksController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    if params[:zen]
      head :no_content
      return
    else
      pr = params[:pull_request]
      WebHooksPullRequestUpdaterJob.perform_later(pr)
    end
  end
end

