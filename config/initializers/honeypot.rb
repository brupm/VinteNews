require 'honeypot'

Honeypot.configure do |config|
  config.authentication_token = "2b8f19f43603ef9cd9c3be3cacf18ffab8e38f30c7f70957b5d00282dae6da4e"
  config.uri = URI.parse("http://127.0.0.1:3001/in/issues")
end
