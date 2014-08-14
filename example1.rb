require 'faraday'
require 'json'

#response = Faraday.post do |req|
#    req.url "http://www.cnn.com"
#end

conn = Faraday.new('https://api.github.com/') do |c|
  c.use Faraday::Response::RaiseError       # raise exceptions on 40x, 50x responses
  c.use Faraday::Adapter::NetHttp
end

response = conn.get('/')

#print response.body['current_user_url'].val

new_response = JSON.parse(response.body)

print new_response['organization_url']

#print response.body
