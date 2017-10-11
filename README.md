# Authorize.Net Ruby SDK

[![Travis CI Status](https://travis-ci.org/AuthorizeNet/sdk-ruby.svg?branch=master)](https://travis-ci.org/AuthorizeNet/sdk-ruby)
[![Coverage Status](https://coveralls.io/repos/github/AuthorizeNet/sdk-ruby/badge.svg?branch=master)](https://coveralls.io/github/AuthorizeNet/sdk-ruby?branch=master)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/AuthorizeNet/sdk-ruby/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/AuthorizeNet/sdk-ruby/?branch=master)
[![Gem Version](https://badge.fury.io/rb/authorizenet.svg)](https://badge.fury.io/rb/authorizenet)


## Requirements
* Ruby 2.2.0 or higher
* RubyGem 1.3.7 or higher (to build the gem)
* RDoc 1.0 or higher (to build documentation)
* Rake 0.8.7 or higher (to use the rake tasks)
* Bundle 1.6 or higher
* RSpec 2.1 or higher (to run rspec tests)
* An Authorize.Net account (see _Registration & Configuration_ section below)

### TLS 1.2
The Authorize.Net APIs only support connections using the TLS 1.2 security protocol. It's important to make sure you have new enough versions of all required components to support TLS 1.2. Additionally, it's very important to keep these components up to date going forward to mitigate the risk of any security flaws that may be discovered in your system or any libraries it uses.


## Installation

### Installation from rubygems.org
```
  > sudo gem install authorizenet
```

### Installation from project
```
  > bundle install
  > rake gem
  > sudo gem install ./authorizenet-1.9.3.gem
```


## Registration & Configuration
Use of this SDK and the Authorize.Net APIs requires having an account on our system. You can find these details in the Settings section.
If you don't currently have a production Authorize.Net account and need a sandbox account for testing, you can easily sign up for one [here](https://developer.authorize.net/sandbox/).

### Authentication
To authenticate with the Authorize.Net API you will need to use your account's API Login ID and Transaction Key. If you don't have these values, you can obtain them from our Merchant Interface site. Access the Merchant Interface for production accounts at (https://account.authorize.net/) or sandbox accounts at (https://sandbox.authorize.net).

Once you have your keys simply load them into the appropriate variables in your code, as per the below sample code dealing with the authentication part of the API request.

#### To set your API credentials for an API request:
```ruby
transaction = Transaction.new('YOUR_API_LOGIN_ID', 'YOUR_TRANSACTION_KEY', :gateway => :sandbox)
```

You should never include your Login ID and Transaction Key directly in a file that's in a publically accessible portion of your website. A better practice would be to define these in a constants file, and then reference those constants in the appropriate place in your code.

#### Setting OAuth credentials
Access Tokens can be setup using the transaction instantiation without the constructor. For example, in the method above:
```ruby
transaction = Transaction.new
transaction.access_token = 'testTokenValue'
transaction.options_OAuth = {:gateway => :sandbox, :verify_ssl => true}
```  

### Switching between the sandbox environment and the production environment
Authorize.Net maintains a complete sandbox environment for testing and development purposes. This sandbox environment is an exact duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this SDK is configured to communicate with the sandbox environment. To switch to the production environment, replace the environment constant in the transaction instantiation.  For example:
```ruby
# For PRODUCTION use
transaction = Transaction.new('YOUR_API_LOGIN_ID', 'YOUR_TRANSACTION_KEY', :gateway => :production)
```

API credentials are different for each environment, so be sure to switch to the appropriate credentials when switching environments.


## SDK Usage Examples and Sample Code
To get started using this SDK, it's highly recommended to download our sample code repository:
* [Authorize.Net Ruby Sample Code Repository (on GitHub)](https://github.com/AuthorizeNet/sample-code-ruby)

In that respository, we have comprehensive sample code for all common uses of our API:

Additionally, you can find details and examples of how our API is structured in our API Reference Guide:
* [Developer Center API Reference](http://developer.authorize.net/api/reference/index.html)

The API Reference Guide provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.


## Building & Testing the SDK

### Running the SDK Tests
To run the integration tests (hitting the sandbox):
```
rake spec
```
To run the unit tests:
```
rake spec:ci
```

To get spec/reporting_spec.rb to pass, go to https://sandbox.authorize.net/ under Account tab->Transaction Details API and enable it.

To run rspec tests, create a spec/credentials.yml with the following keys and the values obtained as described below.
```ruby
#obtain an API login_id and transaction_id according to instructions at https://developer.authorize.net/faqs/#gettranskey
api_login_id: {login_id_value}
api_transaction_key: {transaction_key_value}
#obtained md5 hash value by first setting the hash value in https://sandbox.authorize.net/ under the Account tab->MD5 Hash
md5_value: {md5_value}
```

### Testing Guide
For additional help in testing your own code, Authorize.Net maintains a [comprehensive testing guide](http://developer.authorize.net/hello_world/testing_guide/) that includes test credit card numbers to use and special triggers to generate certain responses from the sandbox environment.


## License
This repository is distributed under a proprietary license. See the provided [`LICENSE.txt`](/LICENSE.txt) file.