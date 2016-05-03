VCR.configure do |c|  
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr/fixtures'
  c.debug_logger = File.open('spec/vcr/fixtures/debug_log', 'w')
  c.ignore_localhost = true
  c.filter_sensitive_data('<GITHUB_USERNAME>') { ENV['GITHUB_USERNAME'] }  
  c.filter_sensitive_data('<GITHUB_PASSWORD>') { ENV['GITHUB_PASSWORD'] }  
  c.hook_into :webmock
end 