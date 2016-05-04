require 'rails_helper'

RSpec.describe AddLabWebhookJob, :type => :job do
  describe "#preform" do 
    
    before(:all) do
      test_seed 
    end
    
    it "adds a webhook to the repo of the given lab" do
      VCR.use_cassette("create_webhook") do 
        lab = Lab.first
        AddLabWebhookJob.perform_now(lab.id)
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
