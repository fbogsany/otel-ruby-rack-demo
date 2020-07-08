require 'rubygems'
require 'bundler/setup'
require 'net/http'

Bundler.require(:default)

OpenTelemetry::SDK.configure do |c|
  c.use_all
end

App = Rack::Builder.new do
  use OpenTelemetry::Adapters::Rack::Middlewares::TracerMiddleware

  app = proc do |env|
    Net::HTTP.get(URI('http://google.com'))
    [ 200, { 'Content-Type' => 'text/plain' }, ['hello']]
  end
  run app
end.to_app

