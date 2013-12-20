# The SDK initialization enters here. Loads all needed libraries and files. Inspects
# the current runtime to see if Rails is present. If it is, we inject our helper into
# ActiveSupport.

require "cgi"
require "net/https"
require "uri"
require "openssl"
require 'bigdecimal'
require 'nokogiri'
require 'date'

# TODO: Add local data validation where possible

$:.unshift File.dirname(__FILE__)

require "authorize_net/authorize_net"
require "authorize_net/payment_methods/credit_card"
require "authorize_net/payment_methods/echeck"
require "authorize_net/addresses/address"
require "authorize_net/addresses/shipping_address"
require "authorize_net/customer"
require "authorize_net/email_receipt"
require "authorize_net/order"
require "authorize_net/line_item"
require "authorize_net/cim/payment_profile"
require "authorize_net/cim/customer_profile"
require "authorize_net/reporting/batch"
require "authorize_net/reporting/batch_statistics"
require "authorize_net/reporting/transaction_details"
require "authorize_net/reporting/fds_filter"
require "authorize_net/response"
require "authorize_net/key_value_response"
require "authorize_net/xml_response"
require "authorize_net/transaction"
require "authorize_net/key_value_transaction"
require "authorize_net/xml_transaction"
require "authorize_net/fields"

# AIM

require "authorize_net/aim/transaction"
require "authorize_net/aim/response"

# SIM

require "authorize_net/sim/hosted_payment_form"
require "authorize_net/sim/hosted_receipt_page"
require "authorize_net/sim/transaction"
require "authorize_net/sim/response"

# ARB

require "authorize_net/arb/subscription"
require "authorize_net/arb/response"
require "authorize_net/arb/transaction"

# CIM

require "authorize_net/cim/response"
require "authorize_net/cim/transaction"

# Reporting

require "authorize_net/reporting/response"
require "authorize_net/reporting/transaction"

# Load our Rails plugin

if defined?(Rails)
  if defined?(Rails::Railtie)
    module AuthorizeNet
      class Railtie < Rails::Railtie
        initializer "authorize_net.load_path_initialize" do |app|
          %w{ models controllers helpers }.each do |dir|
            path = File.join(File.dirname(__FILE__), 'app', dir)
            $LOAD_PATH << path
            ActiveSupport::Dependencies.autoload_paths << path
            ActiveSupport::Dependencies.autoload_once_paths.delete(path)
          end
        end
      end
    end
  else
    %w{ models controllers helpers }.each do |dir|
      path = File.join(File.dirname(__FILE__), 'app', dir)
      $LOAD_PATH << path
      ActiveSupport::Dependencies.load_paths << path
      ActiveSupport::Dependencies.load_once_paths.delete(path)
    end
  end
end
