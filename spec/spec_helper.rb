require 'capybara/rspec'
require 'rails_helper'
require 'webmock/rspec'  
require 'rspec/retry'

require_relative "./support/deep_struct.rb"
require_relative "./support/vcr_setup.rb"
require_relative "./support/capybara_setup.rb"
require_relative "./support/billy_setup.rb"



RSpec.configure do |config|
  config.include Capybara::DSL
 

  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    DatabaseCleaner.strategy = :truncation

  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end


  config.verbose_retry = true
  # show exception that triggers a retry if verbose_retry is set to true
  config.display_try_failure_messages = true

  # run retry only on features
  config.around :each, :js do |ex|
    ex.run_with_retry retry: 10
  end

  config.around(:each, type: :feature) do |example|
    WebMock.allow_net_connect!
    example.run
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end




def test_seed
  cohort = Cohort.create(name: "web-0416")
  lab = Lab.create(name: "Strong Params Basics", 
    repo: "https://github.com/learn-co-students/strong-params-basics-web-0416", 
    deploy_date: Date.today, 
    cohort: cohort)
  cohort.roster_csv_file_name = "students.csv"
  cohort.create_members
  cohort.students << Student.create(first_name: "Sophie", last_name: "DeBenedetto", github_username: "SophieDeBenedetto")
  cohort.save
end






















