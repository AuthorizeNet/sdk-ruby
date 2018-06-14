require 'simplecov'
SimpleCov.start

require 'scrutinizer/ocular'
Scrutinizer::Ocular.watch!

require "authorizenet"
require "yaml"

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include SharedHelper
end
