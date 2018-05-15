require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

require "authorizenet"
require "yaml"

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include SharedHelper
end
