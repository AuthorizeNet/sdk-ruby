require "authorize_net"
require "yaml"
require 'coveralls'
Coveralls.wear!

Dir['./spec/support/**/*.rb'].each{ |f| require f }

RSpec.configure do |config|
  config.include SharedHelper
end
