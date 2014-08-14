require 'faraday'

conn = Faraday.new('http://www.cnn.com/') do |c|
  c.use Faraday::Adapter::NetHttp
end

response = conn.get('/')

print response.body