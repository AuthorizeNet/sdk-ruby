# Authorize.Net Ruby SDK

[![Build Status](https://travis-ci.org/AuthorizeNet/sdk-ruby.png?branch=future)](https://travis-ci.org/AuthorizeNet/sdk-ruby)

`gem install authorizenet`

## Prerequisites

* Ruby 1.9.3 or higher
* RubyGem 1.3.7 or higher (to build the gem)
* RDoc 1.0 or higher (to build documentation)
* Rake 0.8.7 or higher (to use the rake tasks)
* Bundle 1.6 or higher
* RSpec 2.1 or higher (to run rspec tests)

## Installation from rubygems.org

````
  > sudo gem install authorizenet
````
##

# Installation from project

````
  > bundle install
  > rake gem
  > sudo gem install ./authorizenet-1.8.3.gem
````
## Registration & Configuration

Get a sandbox account at https://developer.authorize.net/sandbox/
To run rspec tests, create a spec/credentials.yml with the following keys and the values obtained as described below.
````
#obtain an API login_id and transaction_id according to instructions at https://developer.authorize.net/faqs/#gettranskey
api_login_id: {login_id_value}
api_transaction_key: {transaction_key_value}
#obtained md5 hash value by first setting the hash value in https://sandbox.authorize.net/ under the Account tab->MD5 Hash
md5_value: {md5_value}
````
## Running the Tests
To run the integration tests (hitting the sandbox):
````
rake spec
````
To run the unit tests:
````
rake spec:ci
````

To get spec/reporting_spec.rb to pass, go to https://sandbox.authorize.net/ under Account tab->Transaction Details API and enable it.

## Usage

### Advanced Merchant Integration (AIM)

````ruby
  require 'rubygems'
  require 'authorizenet'
  
  transaction = AuthorizeNet::AIM::Transaction.new('API_LOGIN', 'API_KEY', :gateway => :sandbox)
  credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
  response = transaction.purchase('10.00', credit_card)
  
  if response.success?
    puts "Successfully made a purchase (authorization code: #{response.authorization_code})"
  else
    raise "Failed to make purchase."
  end
````

### Direct Post Method (DPM)

A generator is provided to aid in setting up a Direct Post Method application. In the example below +payments+ is the name of the controller to generate.
````
  > sudo gem install rails -v '>= 3.2'
  > sudo gem install authorizenet
  > rails new my_direct_post_app
  > cd my_direct_post_app
````
  Edit Gemfile and add the line "gem 'authorizenet'"
````
  > rails g authorize_net:direct_post payments YOUR_API_LOGIN_ID YOUR_TRANSACTION_KEY MERCH_HASH_KEY
  > rails server 
````

After running the generator you will probably want to customize the payment form found in <tt>app/views/payments/payment.erb</tt> and the receipt found in <tt>app/views/payments/receipt.erb</tt>.

There is also a default layout generated, <tt>app/views/layouts/authorize_net.erb</tt>. If you already have your own layout, you can delete that file and the reference to it in the controller (<tt>app/controllers/payments_controller.rb</tt>).

### Server Integration Method (SIM)

A generator is provided to aid in setting up a Server Integration Method application. In the example below +payments+ is the name of the controller to generate.
````
  > sudo gem install rails -v '>= 3.2'
  > sudo gem install authorizenet
  > rails new my_sim_app
  > cd my_sim_app
````
  Edit Gemfile and add the line "gem 'authorizenet'"
````
  > rails g authorize_net:sim payments YOUR_API_LOGIN_ID YOUR_TRANSACTION_KEY MERCH_HASH_KEY
  > rails server
````  
After running the generator you will probably want to customize the payment page found in <tt>app/views/payments/payment.erb</tt> and the thank you page found in <tt>app/views/payments/thank_you.erb</tt>.

You may also want to customize the actual payment form and receipt pages. That can be done by making the necessary changes to the AuthorizeNet::SIM::Transaction object (<tt>@sim_transaction</tt>) found in the +payment+ action in <tt>app/controllers/payments_controller.rb</tt>. The styling of those hosted pages are controlled by the AuthorizeNet::SIM::HostedReceiptPage and AuthorizeNet::SIM::HostedPaymentForm objects (which are passed to the AuthorizeNet::SIM::Transaction).

There is also a default layout generated, <tt>app/views/layouts/authorize_net.erb</tt>. If you already have your own layout, you can delete that file and the reference to it in the controller (<tt>app/controllers/payments_controller.rb</tt>).

### Automated Recurring Billing (ARB)
````ruby
  require 'rubygems'
  require 'authorizenet'
  
  transaction = AuthorizeNet::ARB::Transaction.new('API_LOGIN', 'API_KEY', :gateway => :sandbox)
  subscription = AuthorizeNet::ARB::Subscription.new(
    :name => "Monthly Gift Basket",
    :length => 1,
    :unit => :month,
    :start_date => Date.today,
    :total_occurrences => :unlimited,
    :amount => 100.00,
    :invoice_number => '1234567',
    :description => "John Doe's Monthly Gift Basket",
    :credit_card => AuthorizeNet::CreditCard.new('4111111111111111', '1120'),
    :billing_address => AuthorizeNet::Address.new(:first_name => 'John', :last_name => 'Doe')
  )
  response = transaction.create(subscription)
  
  if response.success?
    puts "Successfully created a subscription (subscription id: #{response.subscription_id})"
  else
    raise "Failed to create a subscription."
  end
````
### Card Present (CP)
````ruby
  require 'rubygems'
  require 'authorizenet'

  transaction = AuthorizeNet::AIM::Transaction.new('API_LOGIN', 'API_KEY', :gateway => :card_present_sandbox)
  credit_card = AuthorizeNet::CreditCard.new(nil, nil, :track_1 => '%B4111111111111111^DOE/JOHN^1803101000000000020000831000000?')
  response = transaction.purchase('10.00', credit_card)

  if response.success?
    puts "Successfully made a purchase (authorization code: #{response.authorization_code})"
  else
    raise "Failed to make purchase."
  end
````
## Credit Card Test Numbers

For your reference, you can use the following test credit card numbers.
The expiration date must be set to the present date or later. Use 123 for
the CCV code.

* American Express:  370000000000002
* Discover:  6011000000000012
* Visa:  4007000000027
* JCB: 3088000000000017
* Diners Club/ Carte Blanche:  38000000000006
* Visa (Card Present Track 1): %B4111111111111111^DOE/JOHN^1803101000000000020000831000000?

## New Model

We’re exploring a new model of maintaining the SDKs which allows us to be more responsive to API changes.  This model is consistent across the different SDK languages, which is great for us, however we do not want to sacrifice your productivity by losing the inherent efficiencies in the Ruby language.  To this end we’re introducing the new model as purely “experimental” at this time and we would appreciate your feedback.  Let us know what you really think!  Here’s an example of a server side call with ApplePay data in the new model.

### Apple Pay Example
````ruby
  require 'rubygems'
  require 'authorizenet'

  include AuthorizeNet::API

  transaction = Transaction.new('5KP3u95bQpv', '4Ktq966gC55GAX7S', :gateway => :sandbox)
  request = CreateTransactionRequest.new
  request.transactionRequest = TransactionRequestType.new
  request.transactionRequest.amount = 39.55

  request.transactionRequest.payment = PaymentType.new
  request.transactionRequest.payment.opaqueData = OpaqueDataType.new('COMMON.APPLE.INAPP.PAYMENT','eyJkYXRhIjoiQkRQTldTdE1tR2V3UVVXR2c0bzdFXC9qKzFjcTFUNzhxeVU4NGI2N2l0amNZSTh3UFlBT2hzaGpoWlBycWRVcjRYd1BNYmo0emNHTWR5KysxSDJWa1BPWStCT01GMjV1YjE5Y1g0bkN2a1hVVU9UakRsbEIxVGdTcjhKSFp4Z3A5ckNnc1NVZ2JCZ0tmNjBYS3V0WGY2YWpcL284WkliS25yS1E4U2gwb3VMQUtsb1VNbit2UHU0K0E3V0tycXJhdXo5SnZPUXA2dmhJcStIS2pVY1VOQ0lUUHlGaG1PRXRxK0grdzB2UmExQ0U2V2hGQk5uQ0hxenpXS2NrQlwvMG5xTFpSVFliRjBwK3Z5QmlWYVdIZWdoRVJmSHhSdGJ6cGVjelJQUHVGc2ZwSFZzNDhvUExDXC9rXC8xTU5kNDdrelwvcEhEY1JcL0R5NmFVTStsTmZvaWx5XC9RSk4rdFMzbTBIZk90SVNBUHFPbVhlbXZyNnhKQ2pDWmxDdXcwQzltWHpcL29iSHBvZnVJRVM4cjljcUdHc1VBUERwdzdnNjQybTRQendLRitIQnVZVW5lV0RCTlNEMnU2amJBRzMiLCJ2ZXJzaW9uIjoiRUNfdjEiLCJoZWFkZXIiOnsiYXBwbGljYXRpb25EYXRhIjoiOTRlZTA1OTMzNWU1ODdlNTAxY2M0YmY5MDYxM2UwODE0ZjAwYTdiMDhiYzdjNjQ4ZmQ4NjVhMmFmNmEyMmNjMiIsInRyYW5zYWN0aW9uSWQiOiJjMWNhZjVhZTcyZjAwMzlhODJiYWQ5MmI4MjgzNjM3MzRmODViZjJmOWNhZGYxOTNkMWJhZDlkZGNiNjBhNzk1IiwiZXBoZW1lcmFsUHVibGljS2V5IjoiTUlJQlN6Q0NBUU1HQnlxR1NNNDlBZ0V3Z2ZjQ0FRRXdMQVlIS29aSXpqMEJBUUloQVBcL1wvXC9cLzhBQUFBQkFBQUFBQUFBQUFBQUFBQUFcL1wvXC9cL1wvXC9cL1wvXC9cL1wvXC9cL1wvXC9cL01Gc0VJUFwvXC9cL1wvOEFBQUFCQUFBQUFBQUFBQUFBQUFBQVwvXC9cL1wvXC9cL1wvXC9cL1wvXC9cL1wvXC9cLzhCQ0JheGpYWXFqcVQ1N1BydlZWMm1JYThaUjBHc014VHNQWTd6ancrSjlKZ1N3TVZBTVNkTmdpRzV3U1RhbVo0NFJPZEpyZUJuMzZRQkVFRWF4ZlI4dUVzUWtmNHZPYmxZNlJBOG5jRGZZRXQ2ek9nOUtFNVJkaVl3cFpQNDBMaVwvaHBcL200N242MHA4RDU0V0s4NHpWMnN4WHM3THRrQm9ONzlSOVFJaEFQXC9cL1wvXC84QUFBQUFcL1wvXC9cL1wvXC9cL1wvXC9cLys4NXZxdHB4ZWVoUE81eXNMOFl5VlJBZ0VCQTBJQUJHbStnc2wwUFpGVFwva0RkVVNreHd5Zm84SnB3VFFRekJtOWxKSm5tVGw0REdVdkFENEdzZUdqXC9wc2hCWjBLM1RldXFEdFwvdERMYkUrOFwvbTB5Q21veHc9IiwicHVibGljS2V5SGFzaCI6IlwvYmI5Q05DMzZ1QmhlSEZQYm1vaEI3T28xT3NYMkora0pxdjQ4ek9WVmlRPSJ9LCJzaWduYXR1cmUiOiJNSUlEUWdZSktvWklodmNOQVFjQ29JSURNekNDQXk4Q0FRRXhDekFKQmdVckRnTUNHZ1VBTUFzR0NTcUdTSWIzRFFFSEFhQ0NBaXN3Z2dJbk1JSUJsS0FEQWdFQ0FoQmNsK1BmMytVNHBrMTNuVkQ5bndRUU1Ba0dCU3NPQXdJZEJRQXdKekVsTUNNR0ExVUVBeDRjQUdNQWFBQnRBR0VBYVFCQUFIWUFhUUJ6QUdFQUxnQmpBRzhBYlRBZUZ3MHhOREF4TURFd05qQXdNREJhRncweU5EQXhNREV3TmpBd01EQmFNQ2N4SlRBakJnTlZCQU1lSEFCakFHZ0FiUUJoQUdrQVFBQjJBR2tBY3dCaEFDNEFZd0J2QUcwd2daOHdEUVlKS29aSWh2Y05BUUVCQlFBRGdZMEFNSUdKQW9HQkFOQzgra2d0Z212V0YxT3pqZ0ROcmpURUJSdW9cLzVNS3ZsTTE0NnBBZjdHeDQxYmxFOXc0ZklYSkFEN0ZmTzdRS2pJWFlOdDM5ckx5eTd4RHdiXC81SWtaTTYwVFoyaUkxcGo1NVVjOGZkNGZ6T3BrM2Z0WmFRR1hOTFlwdEcxZDlWN0lTODJPdXA5TU1vMUJQVnJYVFBITmNzTTk5RVBVblBxZGJlR2M4N20wckFnTUJBQUdqWERCYU1GZ0dBMVVkQVFSUk1FK0FFSFpXUHJXdEpkN1laNDMxaENnN1lGU2hLVEFuTVNVd0l3WURWUVFESGh3QVl3Qm9BRzBBWVFCcEFFQUFkZ0JwQUhNQVlRQXVBR01BYndCdGdoQmNsK1BmMytVNHBrMTNuVkQ5bndRUU1Ba0dCU3NPQXdJZEJRQURnWUVBYlVLWUNrdUlLUzlRUTJtRmNNWVJFSW0ybCtYZzhcL0pYditHQlZRSmtPS29zY1k0aU5ERkFcL2JRbG9nZjlMTFU4NFRId05SbnN2VjNQcnY3UlRZODFncTBkdEM4elljQWFBa0NISUkzeXFNbko0QU91NkVPVzlrSmsyMzJnU0U3V2xDdEhiZkxTS2Z1U2dRWDhLWFFZdVpMazJScjYzTjhBcFhzWHdCTDNjSjB4Z2VBd2dkMENBUUV3T3pBbk1TVXdJd1lEVlFRREhod0FZd0JvQUcwQVlRQnBBRUFBZGdCcEFITUFZUUF1QUdNQWJ3QnRBaEJjbCtQZjMrVTRwazEzblZEOW53UVFNQWtHQlNzT0F3SWFCUUF3RFFZSktvWklodmNOQVFFQkJRQUVnWUJhSzNFbE9zdGJIOFdvb3NlREFCZitKZ1wvMTI5SmNJYXdtN2M2VnhuN1phc05iQXEzdEF0OFB0eSt1UUNnc3NYcVprTEE3a3oyR3pNb2xOdHY5d1ltdTlVandhcjFQSFlTK0JcL29Hbm96NTkxd2phZ1hXUnowbk1vNXkzTzFLelgwZDhDUkhBVmE4OFNyVjFhNUpJaVJldjNvU3RJcXd2NXh1WmxkYWc2VHI4dz09In0=') 

  request.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

  response = transaction.create_transaction(request)

  if response.messages.resultCode == MessageTypeEnum::Ok
    puts "Successfully made a purchase (authorization code: #{response.transactionResponse.authCode})"
  else
    raise "Failed to make purchase."
  end


  
````

