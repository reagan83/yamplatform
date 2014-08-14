require 'faraday'

BearerToken = "YOUR_TOKEN"
SharedWithEmails = "email@email.com"

response = Faraday.post do |req|
    req.url "https://www.yammer.com/api/v1/shares"
    req.headers["Authorization"] = "Bearer " + BearerToken
    req.params['attached_objects'] = ["page:585285"]
    req.params['shared_with_emails'] = [SharedWithEmails]
    req.params['body'] = "WHO"
end

print response.body 

# conn = Faraday.new(:url => 'http://yammer.com') do |y|
#   y.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
#   y.use Faraday::Response::Logger     # log request & response to STDOUT
#   y.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
# end

# response = conn.get '/nigiri/sake.json'     # GET http://sushi.com/nigiri/sake.json
# response.body

# conn.post '/nigiri', { :name => 'Maguro' }  # POST "name=maguro" to http://sushi.com/nigiri
