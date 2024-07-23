# require 'simplecov'
# SimpleCov.start

# require 'scrutinizer/ocular'
# Scrutinizer::Ocular.watch!

require "authorizenet"
require "yaml"

ActiveSupport::Deprecation.behavior = lambda do |msg, stack|
  # when running this test suite ignore our own deprecation warnings
  unless /use AuthorizeNet::API::Transaction/ =~ msg
    ActiveSupport::Deprecation::DEFAULT_BEHAVIORS[:stderr].call(msg, stack, ActiveSupport::Deprecation.new)
  end
end

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include SharedHelper
end
