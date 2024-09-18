# Authorize.Net Ruby SDK

[![Authorize.net Ruby CI](https://github.com/AuthorizeNet/sdk-ruby/actions/workflows/ruby-workflow.yml/badge.svg?branch=master)](https://github.com/AuthorizeNet/sdk-ruby/actions/workflows/ruby-workflow.yml)
[![Version         ][rubygems_badge]][rubygems]

Starting Release 1.8.6 November 2015 the Authorize.Net API has been [reorganized to be more merchant focused](https://developer.authorize.net/api/upgrade_guide/).
AIM, ARB, CIM, Reporting and SIM have all been deprecated in favor of sdk-ruby/lib/authorize_net/api.

## Requirements
* Ruby 2.4 or higher
* RubyGem 1.3.7 or higher (to build the gem)
* RDoc 1.0 or higher (to build documentation)
* Rake 0.8.7 or higher (to use the rake tasks)
* Bundle 1.6 or higher
* RSpec 2.1 or higher (to run rspec tests)
* An Authorize.Net account (see _Registration & Configuration_ section below)

### Migrating from older versions  
Since August 2018, the Authorize.Net API has been reorganized to be more merchant focused. AuthorizeNetAIM, AuthorizeNetARB, AuthorizeNetCIM, Reporting and AuthorizeNetSIM classes have been deprecated in favor of AuthorizeNet::API. To see the full list of mapping of new features corresponding to the deprecated features, see [MIGRATING.md](MIGRATING.md).  

### Contribution  
  - If you need information or clarification about Authorize.Net features, create an issue with your question. You can also search the [Authorize.Net developer community](https://community.developer.authorize.net/) for discussions related to your question.  
  - Before creating pull requests, read [the contributors guide](CONTRIBUTING.md).
  
### TLS 1.2
The Authorize.Net API only support connections using the TLS 1.2 security protocol. Make sure to upgrade all required components to support TLS 1.2. Keep these components up to date to mitigate the risk of new security flaws.


## Installation

### Installation from rubygems.org
```
  > sudo gem install authorizenet
```

### Installation from project
```
  > bundle install
  > rake gem
  > sudo gem install ./authorizenet-<version>.gem
```


## Registration & Configuration
Use of this SDK and the Authorize.Net APIs requires having an account on the Authorize.Net system. You can find these details in the Settings section.
If you don't currently have a production Authorize.Net account, [sign up for a sandbox account](https://developer.authorize.net/sandbox/).

### Authentication
To authenticate with the Authorize.Net API, use your account's API Login ID and Transaction Key. If you don't have these credentials, obtain them from the Merchant Interface.  For production accounts, the Merchant Interface is located at (https://account.authorize.net/), and for sandbox accounts, at (https://sandbox.authorize.net).

After you have obtained your credentials, load them into the appropriate variables in your code. The below sample code shows how to set the credentials as part of the API request.

#### To set your API credentials for an API request:
```ruby
transaction = Transaction.new('YOUR_API_LOGIN_ID', 'YOUR_TRANSACTION_KEY', :gateway => :sandbox)
```

Never include your API Login ID and Transaction Key directly in a file in a publicly accessible portion of your website. As a best practice, define the API Login ID and Transaction Key in a constants file, and reference those constants in your code.

#### Setting OAuth credentials
Access Tokens can be set up using the transaction instantiation without the constructor. For example, in the method above:
```ruby
transaction = Transaction.new
transaction.access_token = 'testTokenValue'
transaction.options_OAuth = {:gateway => :sandbox, :verify_ssl => true}
```  

### Switching between the sandbox environment and the production environment
Authorize.Net maintains a complete sandbox environment for testing and development purposes. The sandbox environment is an exact replica of our production environment, with simulated transaction authorization and settlement. By default, this SDK is configured to use the sandbox environment. To switch to the production environment, replace the environment constant in the transaction instantiation.  For example:
```ruby
# For PRODUCTION use
transaction = Transaction.new('YOUR_API_LOGIN_ID', 'YOUR_TRANSACTION_KEY', :gateway => :production)
```
API credentials are different for each environment, so be sure to switch to the appropriate credentials when switching environments.

## SDK Usage Examples and Sample Code
When using this SDK, downloading the Authorize.Net sample code repository is recommended.
* [Authorize.Net Ruby Sample Code Repository (on GitHub)](https://github.com/AuthorizeNet/sample-code-ruby)

The repository contains comprehensive sample code for common uses of the Authorize.Net API.

The API Reference contains details and examples of the structure and formatting of the Authorize.Net API.
* [Developer Center API Reference](http://developer.authorize.net/api/reference/index.html)

Use the examples in the API Reference to determine which methods and information to include in an API request using this SDK.

## Create a Chase Pay Transaction

Use this method to authorize and capture a payment using a tokenized credit card number issued by Chase Pay. Chase Pay transactions are only available to merchants using the Paymentech processor.

The following information is required in the request:
- **payment token**
- **expiration date**
- **cryptogram** received from the token provider
- **tokenRequestorName**
- **tokenRequestorId**
- **tokenRequestorEci**

When using the SDK to submit Chase Pay transactions, consider the following points:
- `tokenRequesterName` must be populated with **`”CHASE_PAY”`**
- `tokenRequestorId` must be populated with the **`Token Requestor ID`** provided by Chase Pay services for each transaction during consumer checkout
- `tokenRequesterEci` must be populated with the **`ECI Indicator`** provided by Chase Pay services for each transaction during consumer checkout  


## Building & Testing the SDK

### Running the SDK Tests
To run the integration tests in the sandbox:
```
rake spec
```

To run rspec tests, create a spec/credentials.yml with the following credentials and the values obtained as described below.
```ruby
#obtain an API login_id and transaction_id according to instructions at https://developer.authorize.net/faqs/#gettranskey
api_login_id: {login_id_value}
api_transaction_key: {transaction_key_value}
```

### Testing Guide
For additional help in testing your code, Authorize.Net maintains a [comprehensive testing guide](http://developer.authorize.net/hello_world/testing_guide/) that includes test credit card numbers to use and special triggers to generate certain responses from the sandbox environment.

## Logging Sensitive Data
A new sensitive data logger has been introduced with the Authorize.Net Ruby SDK. To use it in your code, create a file called `LogConfig.yml` and place it in the base folder of your application. The logger configuration should contain the following lines:
```
loglevel: info
filepath: <file_path>
maskSensitiveData: true
```
The logger code uses the default Ruby `Logger` library. There is no need to install external libraries for the purpose of logging. The above three fields in the LogConfig.yml file are mandatory. The logging levels available are `debug, info, warn` and `error`.

The value for `maskSensitiveData` can either be `true` or `false`. Setting the `maskSensitiveData` flag to `true` masks the sensitive data in the request XML body while logging to the log file. You can turn off logging by removing the configuration file from your application folder. 

The sensitive fields that are masked during logging are:
* Card Number
* Card Code
* Expiration Date
* Transaction Key
* Account Number
* Name on Account

There is also a list of regular expressions which the sensitive logger uses to mask credit card numbers while logging. 

More information on the regular expressions used during sensitive data logging [can be found here](https://github.com/AuthorizeNet/sdk-ruby/blob/master/lib/authorize_net/api/SensitiveDataFilter.rb).

### Transaction Hash Upgrade
Authorize.Net is phasing out the MD5 based `transHash` element in favor of the SHA-512 based `transHashSHA2`. The setting in the Merchant Interface which controlled the MD5 Hash option is no longer available, and the `transHash` element will stop returning values at a later date to be determined. For information on how to use `transHashSHA2`, see the [Transaction Hash Upgrade Guide](https://developer.authorize.net/support/hash_upgrade/).

## License
This repository is distributed under a proprietary license. See the provided [`LICENSE.txt`](/LICENSE.txt) file.

[rubygems_badge]: https://badge.fury.io/rb/authorizenet.svg
[rubygems]: https://rubygems.org/gems/authorizenet