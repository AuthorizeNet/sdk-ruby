require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
   add_filter 'lib/authorize_net/reporting'
   add_filter 'lib/authorize_net/payment_methods'
   add_filter 'lib/authorize_net/addresses'
end
