require 'faraday'
require 'json'

BearerToken = "YOUR_TOKEN"

conn = Faraday.new('https://www.yammer.com/') do |c|
  c.use Faraday::Adapter::NetHttp
  c.headers["Authorization"] = "Bearer " + BearerToken
  c.params["body"] = "Hello world!"
  c.params["group_id"] = 3257958
end

response = conn.post('/api/v1/messages.json')

foobar = JSON.parse(response.body)
print foobar
