Billy.configure do |c|
  c.cache = true
  c.ignore_params = ["http://www.google-analytics.com/__utm.gif",
                     "http://b.siftscience.com/i.gif",
                     "https://r.twimg.com/jot",
                     "http://p.twitter.com/t.gif",
                     "http://p.twitter.com/f.gif",
                     "http://www.facebook.com/plugins/like.php",
                     "https://www.facebook.com/dialog/oauth",
                     "http://cdn.api.twitter.com/1/urls/count.json"]
  c.persist_cache = true
  c.cache_path = 'spec/req_cache/'
  c.proxied_request_connect_timeout = 260
  c.proxied_request_inactivity_timeout = 260

end
 
# need to call this because of a race condition between persist_cache
# being set and the proxy being loaded for the first time
Billy.proxy.reset_cache