class PullRequestsController < ApplicationController

  def create
    @lab = Lab.find_by(slug: params[:lab])
    @pull_requests = PullRequestFetcherJob.perform_now(@lab.id)
    
    respond_to do |format|
      format.js
      format.html
    end
  end
end
