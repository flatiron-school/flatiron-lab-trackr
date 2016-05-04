class WebhooksController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    if params[:zen]
      head :no_content
      return
    else
      WebHooksPullRequestUpdater.perform_later(params[:pull_request])
    end
  end
end

