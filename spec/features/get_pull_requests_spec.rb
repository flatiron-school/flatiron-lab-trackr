require 'rails_helper'

RSpec.describe "GetPullRequests", :type => :feature do
  describe "GET /get_pull_requests", js: true do
    it "retreives student pull requests for a lab when 'get prs button' is clicked on lab show page" do
      VCR.use_cassette('pull_requests') do
        binding.pry
        test_seed
        cohort = Cohort.first
        lab = Lab.first
        visit cohort_lab_path(cohort, lab)
        click_link "get-prs-btn"
        expect(lab.pull_requests.count).to eq(29)
      end
    end
  end
end
