class PullRequestsController < ApplicationController

  def create
    @lab = Lab.find_by(slug: params[:lab])
    @pull_requests = PullRequestFetcher.new.perform(@lab.id)
    
    respond_to do |format|
      format.js
      format.html
    end
  end
end
