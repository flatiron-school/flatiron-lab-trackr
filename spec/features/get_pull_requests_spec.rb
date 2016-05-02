require 'rails_helper'

RSpec.describe "GetPullRequests", :type => :request do
  describe "GET /get_pull_requests", js: true do
    it "retreives student pull requests for a lab when 'get prs button' is clicked on lab show page" do
      VCR.use_cassette('fixtures/pull_requests') do
        @cohort = Cohort.create(name: "web-0416")
        @lab = Lab.create(name: "Strong Params Basics", 
          repo: "https://github.com/learn-co-students/strong-params-basics-web-0416", 
          deploy_date: Date.today, 
          cohort: @cohort)
        visit cohort_lab_path(@cohort, @lab)
        click_link "get-prs-btn"
        expect(@lab.pull_requests.count).to eq(25)
      end
    end
  end
end
