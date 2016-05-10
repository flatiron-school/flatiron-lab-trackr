ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rails'
require 'billy/rspec'

# Billy.configure do |c|
#   c.cache = true
#   c.persist_cache = true
#   c.cache_path = 'spec/fixtures'
#   # c.non_whitelisted_requests_disabled = true
#   # Stripe uses jsonp, which changes its callback param based on the current time
#   # That means we'd never hit the cache, so this makes it ignore the param that changes
#   c.dynamic_jsonp = true
#   c.dynamic_jsonp_keys = ["callback"]
# end


# select a driver for your chosen browser environment
# Billy.configure do |c|
#   c.cache = true
#   c.ignore_params = ["https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js", "http://127.0.0.1"]
#   c.persist_cache = true
#   c.cache_path = 'spec/fixtures'
# end

# # need to call this because of a race condition between persist_cache
# # being set and the proxy being loaded for the first time
# Billy.proxy.restore_cache
 


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end
