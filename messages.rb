require 'faraday'

conn = Faraday.new(:url => 'http://sushi.com') do |c|
  c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
  c.use Faraday::Response::Logger     # log request & response to STDOUT
  c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
end

response = conn.get '/nigiri/sake.json'     # GET http://sushi.com/nigiri/sake.json
response.body

conn.post '/nigiri', { :name => 'Maguro' }  # POST "name=maguro" to http://sushi.com/nigiri
