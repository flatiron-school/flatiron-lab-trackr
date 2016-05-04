require 'rails_helper'


RSpec.describe Adapters, :type => :model do

  before(:all) do 
    test_seed
  end

  describe "::GitHubWrapper#get_pull_requests" do 
    it "fetches all open PRs of a given lab" do 
      VCR.use_cassette('pull_requests') do
        lab = Lab.first
        Adapters::GitHubWrapper.new.get_lab_prs(lab.id)
        expect(lab.pull_requests.count).to eq(30)
      end
    end
  end

  describe "::GitHubWrapper#create_or_update_from_webhook" do 
    it "given a payload of a new PR from github, it creates or updates the appropriate PR and PR files" do
      VCR.use_cassette('pull_request_files_from_payload') do
        payload = File.open(Rails.root.join("spec", "fixtures", "payload_pull_request.json"))
        params_hash = JSON.parse(File.read(payload).gsub("=>", ":").gsub("nil", "null"))
        params = DeepStruct.new(params_hash)
        Adapters::GitHubWrapper.new.create_or_update_from_webhook(params["pull_request"])
        lab = Lab.first
        expect(lab.pull_requests.count).to eq(1)
      end
    end
  end
end
