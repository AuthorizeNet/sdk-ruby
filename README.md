# Authorize.Net Ruby SDK

[![Build Status](https://travis-ci.org/AuthorizeNet/sdk-ruby.png?branch=master)](https://travis-ci.org/AuthorizeNet/sdk-ruby)
[![Coverage Status](https://coveralls.io/repos/namanbansal/sdk-ruby/badge.svg?branch=master&service=github)](https://coveralls.io/github/namanbansal/sdk-ruby?branch=master)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/namanbansal/sdk-ruby/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/namanbansal/sdk-ruby/?branch=master)

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

## Usage
Apart from this README, you can find details and examples of using the SDK in the following places:  

- [Github Sample Code Repository](https://github.com/AuthorizeNet/sample-code-ruby)
- [Developer Center Reference](http://developer.authorize.net/api/reference/index.html)  

### Charging a Credit Card

````ruby
require 'rubygems'
  require 'authorizenet'

  include AuthorizeNet::API

  transaction = Transaction.new('API_LOGIN', 'API_KEY', :gateway => :sandbox)

  request = CreateTransactionRequest.new

  request.transactionRequest = TransactionRequestType.new()
  request.transactionRequest.amount = 16.00
  request.transactionRequest.payment = PaymentType.new
  request.transactionRequest.payment.creditCard = CreditCardType.new('4242424242424242','0220','123') 
  request.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
  
  response = transaction.create_transaction(request)

  if response.messages.resultCode == MessageTypeEnum::Ok
    puts "Successful charge (auth + capture) (authorization code: #{response.transactionResponse.authCode})"

  else
    puts response.messages.messages[0].text
    puts response.transactionResponse.errors.errors[0].errorCode
    puts response.transactionResponse.errors.errors[0].errorText
    raise "Failed to charge card."
  end
````  

### Setting the Production Environment
Replace the environment constant in the transaction instantiation.  For example, in the method above:
```ruby
transaction = Transaction.new('API_LOGIN', 'API_KEY', :gateway => :production)
```  

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



