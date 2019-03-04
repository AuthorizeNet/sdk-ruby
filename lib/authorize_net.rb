# The SDK initialization enters here. Loads all needed libraries and files. Inspects
# the current runtime to see if Rails is present. If it is, we inject our helper into
# ActiveSupport.

# coverall
# require 'coveralls'
# Coveralls.wear!

require "cgi"
require "net/https"
require "uri"
require "openssl"
require 'bigdecimal'
require 'nokogiri'
require 'date'

# TODO: Add local data validation where possible

$LOAD_PATH.unshift File.dirname(__FILE__)

require "authorize_net/authorize_net"
require "authorize_net/customer"
require "authorize_net/email_receipt"
require "authorize_net/order"
require "authorize_net/line_item"
require "authorize_net/response"
require "authorize_net/key_value_response"
require "authorize_net/xml_response"
require "authorize_net/transaction"
require "authorize_net/key_value_transaction"
require "authorize_net/xml_transaction"

# API
require "authorize_net/api/schema"
require "authorize_net/api/api_transaction"
require "authorize_net/api/transaction"

# Load our Rails plugin

if defined?(Rails)
  if defined?(Rails::Railtie)
    module AuthorizeNet
      class Railtie < Rails::Railtie
        initializer "authorize_net.load_path_initialize" do |_app|
          %w[models controllers helpers].each do |dir|
            path = File.join(File.dirname(__FILE__), 'app', dir)
            $LOAD_PATH << path
            ActiveSupport::Dependencies.autoload_paths << path
            ActiveSupport::Dependencies.autoload_once_paths.delete(path)
          end
        end
      end
    end
  else
    %w[models controllers helpers].each do |dir|
      path = File.join(File.dirname(__FILE__), 'app', dir)
      $LOAD_PATH << path
      ActiveSupport::Dependencies.load_paths << path
      ActiveSupport::Dependencies.load_once_paths.delete(path)
    end
  end
end
