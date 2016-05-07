VCR.configure do |c|  
  c.cassette_library_dir = 'spec/vcr/fixtures'
  c.ignore_localhost = true
  c.filter_sensitive_data('<GITHUB_USERNAME>') { ENV['GITHUB_USERNAME'] }  
  c.filter_sensitive_data('<GITHUB_PASSWORD>') { ENV['GITHUB_PASSWORD'] }  
  c.hook_into :webmock
end 
