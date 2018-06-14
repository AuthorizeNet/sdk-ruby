require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
   add_filter 'lib/authorize_net/aim'
   add_filter 'lib/authorize_net/arb'
   add_filter 'lib/authorize_net/cim'
   add_filter 'lib/authorize_net/sim'
   add_filter 'lib/authorize_net/reporting'
   add_filter 'lib/authorize_net/payment_methods'
   add_filter 'lib/authorize_net/addresses'
   add_filter 'sample-code-ruby/**/*'
end
