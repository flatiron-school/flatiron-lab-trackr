VCR.configure do |c|  
  #the directory where your cassettes will be saved
  c.cassette_library_dir = 'spec/vcr/fixtures'
  # c.allow_http_connections_when_no_cassette = false  
  # your HTTP request service. 
  c.hook_into :webmock
end  
raise :hell