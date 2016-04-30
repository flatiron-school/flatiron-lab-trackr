class PullRequestsController < ApplicationController

  def create
    lab = Lab.find_by(slug: params[:lab])
    @pull_requests = Adapters::GitHubWrapper.new.get_lab_prs(lab)

    respond_to do |f|
      f.js
      f.html
    end
  end
end
