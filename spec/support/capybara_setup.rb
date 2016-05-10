Capybara.javascript_driver = :webkit_billy
Capybara.default_max_wait_time = 300
Capybara::Webkit.configure do |config|
  config.allow_url("google-code-prettify.googlecode.com")
  config.allow_url("https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js")
end