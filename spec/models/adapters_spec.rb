require 'rails_helper'

RSpec.describe Adapters, :type => :model do

  before(:all) do 
    test_seed
  end
  describe "::GitHubWrapper#get_pull_requests" do 
    it "fetches all open PRs of a given lab" do 
      VCR.use_cassette('pull_requests') do
        Adapters::GitHubWrapper.new.get_lab_prs(@lab.id)
        expect(@lab.pull_requests.count).to eq(30)
      end
    end
  end

  describe "::GitHubWrapper#create_or_update_from_webhook" do 
    it "receives a payload of a new PR from github and creates or updates the appropriate PR and PR files" do

    end
  end
end
