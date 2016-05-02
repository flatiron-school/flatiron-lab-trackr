require 'rails_helper'

RSpec.describe Adapters, :type => :model do

  before(:all) do 
    test_seed
  end
  describe "::GitHubWrapper#get_pull_requests" do 
    it "fetches all open PRs of a given lab" do 
      VCR.use_cassette('fixtures/pull_requests') do
        Adapters::GitHubWrapper.new.get_lab_prs(@lab.id)
        expect(@lab.pull_requests.count).to eq(29)
      end
    end
  end
end
