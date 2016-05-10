require 'rails_helper'

RSpec.describe "GetPullRequests", :type => :feature do
  describe "GET /get_pull_requests", js: true do
    it "retreives student pull requests for a lab when 'get prs button' is clicked on lab show page" do
        test_seed
        cohort = Cohort.first
        lab = Lab.create(name: "Simple Math", repo: "https://github.com/learn-co-students/simple-math-web-0416", cohort: cohort)
        # lab = Lab.create(name: "Rails Namespaced Routes", repo: "https://github.com/learn-co-students/modification-nested-routes-lab-web-0416", cohort: cohort)
        # lab = Lab.create(name: "OO Lab", repo: "https://github.com/learn-co-students/ruby-objects-belong-to-lab-web-0416", cohort: cohort)
        # lab = Lab.create(name: "Flatiron Kitchen", repo: "https://github.com/learn-co-students/flatiron-kitchen-web-0416", cohort: cohort)
        # lab = Lab.first
      VCR.use_cassette('retreive_pull_requests_feature_test') do
        visit cohort_lab_path(cohort, lab)
        # proxy.stub("https://sophie.debenedetto%40gmail.com:Fvk6dgiv@api.github.com/repos/learn-co-students/strong-params-basics-web-0416/pulls").and_return(json: "stuff")
        click_link "get-prs-btn"
        sleep(10)
      end
      # binding.pry
        expect(lab.pull_requests.count).to eq(1)
    end
  end
end
