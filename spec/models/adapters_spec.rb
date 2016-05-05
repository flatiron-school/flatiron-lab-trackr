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
        Adapters::GitHubWrapper.new.create_or_update_pr_from_webhook(params["pull_request"])
        lab = Lab.first
        expect(lab.pull_requests.count).to eq(1)
      end
    end
  end

  describe "::GitHubWrapper#create_lab_webhook" do 
    it "adds a webhook to a given lab's repo" do
      VCR.use_cassette('create_webhook') do
        lab = Lab.first
        Adapters::GitHubWrapper.new.create_lab_webhook(lab)
        client = Octokit::Client.new(login: ENV["GITHUB_USERNAME"], password: ENV["GITHUB_PASSWORD"])
        hooks = client.hooks("learn-co-students/#{lab.repo.split("/").last}")

        expect(hooks.length).to eq(1)
        expect(hooks.first.config.url).to eq("https://flatiron-lab-trackr.herokuapp.com/webhooks/pull-requests")
        expect(hooks.first.config.url).to eq("https://flatiron-lab-trackr.herokuapp.com/webhooks/pull-requests")
        expect(hooks.first.events).to include("pull_request")
      end
    end
  end
end
