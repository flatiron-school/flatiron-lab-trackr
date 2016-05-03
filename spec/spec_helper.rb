require 'capybara/rspec'
require 'rails_helper'

require 'webmock/rspec'  
require_relative "./support/deep_struct.rb"
require_relative "./support/vcr_setup.rb"


# WebMock.disable_net_connect!(allow_localhost: true)  

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  config.include Capybara::DSL
  # config.before(:each, js: true) do 
  #   DatabaseCleaner.strategy = :truncation 
  # end

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

  # config.before :each do
  #   if Capybara.current_driver == :rack_test
  #     DatabaseCleaner.strategy = :transaction
  #   else
  #     DatabaseCleaner.strategy = :truncation
  #   end
  #   DatabaseCleaner.start
  # end

  # config.after do
  #   DatabaseCleaner.clean
  # end
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
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






















