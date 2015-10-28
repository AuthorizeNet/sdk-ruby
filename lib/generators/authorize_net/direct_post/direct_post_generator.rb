require 'rails/generators'
require 'rails/generators/named_base'

module AuthorizeNet
  module Generators
    class DirectPostGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      p '__FILE__:' + __FILE__
      p 'source_root:' + source_root
      argument :api_login_id, :type => :string, :desc => 'Your Authorize.Net API login ID.', :optional => true
      argument :api_transaction_key, :type => :string, :desc => 'Your Authorize.Net API transaction key.', :optional => true
      argument :merchant_hash_value, :type => :string, :desc => 'Your Authorize.Net merchant hash value.', :optional => true
      desc <<-DESC
Description
    Generates a simple implementation of Authorize.Net's Direct Post Method integration method.

Example:
    rails generate authorize_net:direct_post payments API_LOGIN_ID API_TRANSACTION_KEY MERCHANT_HASH_VALUE

    This will create:
      create  README-AuthorizeNet
      create  app/views/payments
      create  app/views/payments/payment.erb
      create  app/views/payments/receipt.erb
      create  app/views/payments/relay_response.erb
      create  app/views/layouts/authorize_net.erb
      create  config/authorize_net.yml
      create  config/initializers/authorize_net.rb
      create  app/controllers/payments_controller.rb
       route  match '/payments/receipt', :to => 'payments#receipt', :as => 'payments_receipt', :via => [:get]
       route  match '/payments/relay_response', :to => 'payments#relay_response', :as => 'payments_relay_response', :via => [:post]
       route  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]

DESC
      
      def manifest
        copy_file "README-AuthorizeNet", "README-AuthorizeNet"
        empty_directory "app/views/#{file_name}"
        copy_file "payment.rails3.erb", "app/views/#{file_name}/payment.erb"
        copy_file "receipt.erb", "app/views/#{file_name}/receipt.erb"
        copy_file "relay_response.erb", "app/views/#{file_name}/relay_response.erb"
        copy_file "layout.erb", "app/views/layouts/authorize_net.erb"
        template "config.yml.rails3.erb", "config/authorize_net.yml"
        copy_file "initializer.rb", "config/initializers/authorize_net.rb"
        template "controller.rb.erb", "app/controllers/#{file_name}_controller.rb"
        route "match '/#{plural_name}/receipt', :to => '#{file_name}#receipt', :as => '#{singular_name}_receipt', :via => [:get]"
        route "match '/#{plural_name}/relay_response', :to => '#{file_name}#relay_response', :as => '#{singular_name}_relay_response', :via => [:post]"
        route "match '/#{plural_name}/payment', :to => '#{file_name}#payment', :as => '#{singular_name}payment', :via => [:get]"
      end
      
    end
  end
end
