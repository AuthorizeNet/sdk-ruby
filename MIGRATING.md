# Migrating from Legacy Authorize.Net Classes

Authorize.Net no longer supports several legacy classes, including AIM, ARB and others listed below, as part of sdk-ruby. If you are using any of these, we recommend that you update your code to use the new Authorize.Net API classes under (sdk-ruby/lib/authorize_net/api).

**For details on the deprecation and replacement of legacy Authorize.Net APIs, visit https://developer.authorize.net/api/upgrade_guide/.**

## Full list of classes that are no longer supported
| Class                               | New Feature                                                                                                                                                    | Sample Codes directory/repository                                                 |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| AIM (Authorize.NET/AIM)             | [PaymentTransactions](https://developer.authorize.net/api/reference/index.html#payment-transactions)                                                           | [sample-code-ruby/PaymentTransactions](https://github.com/AuthorizeNet/sample-code-ruby/tree/master/PaymentTransactions)    |
| ARB (Authorize.NET/ARB)             | [RecurringBilling](https://developer.authorize.net/api/reference/index.html#recurring-billing)                                                                 | [sample-code-ruby/Recurring Billing](https://github.com/AuthorizeNet/sample-code-ruby/tree/master/RecurringBilling)          | 
| CIM (Authorize.NET/CIM)             | [CustomerProfiles](https://developer.authorize.net/api/reference/index.html#customer-profiles)                                                                 | [sample-code-ruby/CustomerProfiles](https://github.com/AuthorizeNet/sample-code-ruby/tree/master/CustomerProfiles)          |
| SIM (Authorize.NET/SIM)             | [Accept Hosted](https://developer.authorize.net/content/developer/en_us/api/reference/features/accept_hosted.html)                                             | Not available                                                                                                                         |
| Reporting	(Authorize.NET/Reporting) | [TransactionReporting](https://developer.authorize.net/api/reference/index.html#transaction-reporting)                                                         | [Sample-Code-ruby/TransactionReporting](https://github.com/AuthorizeNet/sample-code-ruby/tree/master/TransactionReporting)    |

## Example 
#### New model sample code for (charge-credit-card)
   ```Ruby
require 'rubygems'
require 'yaml'
require 'authorizenet' 
require 'securerandom'

  include AuthorizeNet::API

  def charge_credit_card()
    config = YAML.load_file(File.dirname(__FILE__) + "/../credentials.yml")
    
	# Set the request to operate in either the sandbox or production environment
    transaction = Transaction.new(config["api_login_id"], config["api_transaction_key"], :gateway => :sandbox)
  
    # Create the payment transaction object
    request = CreateTransactionRequest.new
    
	# Populate the payment data
    request.transactionRequest = TransactionRequestType.new()
    request.transactionRequest.amount = ((SecureRandom.random_number + 1 ) * 150 ).round(2)
    request.transactionRequest.payment = PaymentType.new
    request.transactionRequest.payment.creditCard = CreditCardType.new("4242424242424242","0220","123") 
    request.transactionRequest.customer = CustomerDataType.new(CustomerTypeEnum::Individual,"CUST-1234","bmc@mail.com",DriversLicenseType.new("DrivLicenseNumber123","WA","05/05/1990"),"123456789")
      
    # call the Transaction and get the response    
    response = transaction.create_transaction(request)    
    
    return response
  end
  
if __FILE__ == $0
  charge_credit_card()
end
```