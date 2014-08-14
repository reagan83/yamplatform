require 'faraday'
require 'json'

conn = Faraday.new('https://api.github.com/') do |c|
  c.use Faraday::Adapter::NetHttp
end

response = conn.get('/')

foobar = JSON.parse(response.body)

print foobar['rate_limit_url'] + "\n"