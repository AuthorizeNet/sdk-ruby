require 'rails/generators'
require 'rails/generators/named_base'

module AuthorizeNet
  module Generators
    class SimGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      argument :api_login_id, type: :string, desc: 'Your Authorize.Net API login ID.', optional: true
      argument :api_transaction_key, type: :string, desc: 'Your Authorize.Net API transaction key.', optional: true
      argument :merchant_hash_value, type: :string, desc: 'Your Authorize.Net merchant hash value.', optional: true
      desc <<-DESC
Description
    Generates a simple implementation of Authorize.Net's SIM integration method.

Example:
    rails generate authorize_net:sim payments API_LOGIN_ID API_TRANSACTION_KEY MERCHANT_HASH_VALUE

    This will create:
      create  README-AuthorizeNet
      create  app/views/payments
      create  app/views/payments/payment.erb
      create  app/views/payments/thank_you.erb
      create  app/views/layouts/authorize_net.erb
      create  config/authorize_net.yml
      create  config/initializers/authorize_net.rb
      create  app/controllers/payments_controller.rb
       route  match '/payments/thank_you', :to => 'payments#thank_you', :as => 'payments_thank_you', :via => [:get]
       route  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]

DESC

      def manifest
        copy_file "README-AuthorizeNet", "README-AuthorizeNet"
        empty_directory "app/views/#{file_name}"
        copy_file "payment.rails3.erb", "app/views/#{file_name}/payment.erb"
        copy_file "thank_you.erb", "app/views/#{file_name}/thank_you.erb"
        copy_file "layout.erb", "app/views/layouts/authorize_net.erb"
        template "config.yml.rails3.erb", "config/authorize_net.yml"
        copy_file "initializer.rb", "config/initializers/authorize_net.rb"
        template "controller.rb.erb", "app/controllers/#{file_name}_controller.rb"
        route "match '/#{plural_name}/thank_you', :to => '#{file_name}#thank_you', :as => '#{singular_name}_thank_you', :via => [:get]"
        route "match '/#{plural_name}/payment', :to => '#{file_name}#payment', :as => '#{singular_name}payment', :via => [:get]"
      end
    end
  end
end
