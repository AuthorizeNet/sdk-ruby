require "spec_helper"

include  AuthorizeNet::API

describe "SampleCode Testing" do
  
  before :all do
    begin
      Dir.glob("./sample-code-ruby/*/**") do |item| # note one extra "*"
        next if item == '.' or item == '..'
        item = item[0..-4]
        puts "working on: #{item}"
        require item
      end
#      Dir.glob("./sample-code-ruby/RecurringBilling/*") do |item| # note one extra "*"
#        next if item == '.' or item == '..'
#        item = item[0..-4]
#        puts "working on: #{item}"
#        require item
#      end
#      Dir.glob("./sample-code-ruby/PaymentTransactions/*") do |item| # note one extra "*"
#        next if item == '.' or item == '..'
#        item = item[0..-4]
#        puts "working on: #{item}"
#        require item
#      end
#      Dir.glob("./sample-code-ruby/PaypalExpressCheckout/*") do |item| # note one extra "*"
#        next if item == '.' or item == '..'
#        item = item[0..-4]
#        puts "working on: #{item}"
#        require item
#      end
#      Dir.glob("./sample-code-ruby/TransactionReporting/*") do |item| # note one extra "*"
#        next if item == '.' or item == '..'
#        item = item[0..-4]
#        puts "working on: #{item}"
#        require item
#      end
#      Dir.glob("./sample-code-ruby/VisaCheckout/*") do |item| # note one extra "*"
#        next if item == '.' or item == '..'
#        item = item[0..-4]
#        puts "working on: #{item}"
#        require item
#      end
#      Dir.glob("./sample-code-ruby/ApplePayTransactions/*") do |item| # note one extra "*"
#        next if item == '.' or item == '..'
#        item = item[0..-4]
#        puts "working on: #{item}"
#        require item
#      end
      creds = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")
      @api_key = creds['api_transaction_key']
      @api_login = creds['api_login_id']
      @gateway = :sandbox
    rescue Errno::ENOENT => e
      @api_key = "TEST"
      @api_login = "TEST"
      warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
    end
  end
  def validate_response(response= nil)
    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.messages.resultCode).to eq(MessageTypeEnum::Ok)
  end
  
  it "should be able to run all Customer Profile sample code" do
    puts "START"

    response = create_customer_profile()
    validate_response(response)
    customerProfileId = response.customerProfileId
    
    puts "Customer payment profile"
    response = create_customer_payment_profile(customerProfileId)
    validate_response(response)
    customerPaymentProfileId = response.customerPaymentProfileId
    
    puts "Customer shipping address"
    response = create_customer_shipping_address(customerProfileId)
    validate_response(response)
    customerAddressId = response.customerAddressId

    response = validate_customer_payment_profile(customerProfileId, customerPaymentProfileId)
    validate_response(response)
    
#    create_transaction_for_profile = authorize_credit_card()
#    validate_response(response)
#    response = create_customer_profile_from_a_transaction(create_transaction_for_profile.transactionResponse.transId)
#    validate_response(response)
   
    response = get_customer_payment_profile(customerProfileId, customerPaymentProfileId)
    
    validate_response(response)
    
    response = get_customer_payment_profile_list()
    validate_response(response)
    
    response = get_customer_profile(customerProfileId)
    validate_response(response)
    
    response = get_customer_profile_ids()
    validate_response(response)
    
    response = get_customer_shipping_address(customerProfileId, customerAddressId)
    validate_response(response)
    
    response = get_hosted_profile_page(customerProfileId)
    validate_response(response)
        
    response = update_customer_payment_profile(customerProfileId, customerPaymentProfileId)
    validate_response(response)
    
    response = update_customer_profile(customerProfileId)
    validate_response(response)
        
    response = update_customer_shipping_address(customerProfileId, customerAddressId)
    validate_response(response)

    response = delete_customer_shipping_address(customerProfileId, customerAddressId)
    validate_response(response)
        
    response = delete_customer_payment_profile(customerProfileId, customerPaymentProfileId)
    validate_response(response)

    response = delete_customer_profile(customerProfileId)
    validate_response(response)
    
  end
  
it "should be able to run all Recurring Billing sample code" do
    puts "START"

    response = create_subscription()
    validate_response(response)
    subscriptionId = response.subscriptionId
    
    response = get_subscription(subscriptionId)
    validate_response(response)
    
    response = get_list_of_subscriptions()
    validate_response(response)
    #customerAddressId = response.customerAddressId
    
    puts "Get subscription status"
    response = get_subscription_status(subscriptionId)
    validate_response(response)
    
    response = update_subscription(subscriptionId)
    validate_response(response)
    
    puts "Cancel subscription"
    response = cancel_subscription(subscriptionId)
    validate_response(response)
    
    end
    
  
it "should be able to run all Payment Transaction sample code" do
    puts "START"

    response = authorize_credit_card()
    validate_response(response)
    
    response = capture_funds_authorized_through_another_channel()
    validate_response(response)
    
    response = capture_only()
    validate_response(response)
    
    puts "Get subscription status"
    response = capture_funds_authorized_through_another_channel()
    validate_response(response)
    
    response = capture_only()
    validate_response(response)
    
    puts "Cancel subscription"
    response = capture_previously_authorized_amount()
    validate_response(response)
    
    response = charge_credit_card()
    validate_response(response)
    
    response = charge_customer_profile()
    validate_response(response)
    
    response = charge_tokenized_credit_card()
    validate_response(response)
    
    response = credit_bank_account()
    validate_response(response)
    
    response = debit_bank_account()
    validate_response(response)
    
#    response = refund_transaction()
#    validate_response(response)
    
    response = update_split_tender_group()
    validate_response(response)
    
    response = void_transaction()
    validate_response(response)
    end
    
    
it "should be able to run all Paypal Express Checkout sample code" do
    puts "START"

    response = authorization_and_capture()
    validate_response(response)
    
#    response = authorization_only_continued()
#    validate_response(response)
    
    response = authorization_only()
    validate_response(response)
    
    puts "Get subscription status"
#    response = credit()
#    validate_response(response)
    
    response = get_details()
    validate_response(response)
    
    puts "Cancel subscription"
    response = prior_authorization_capture()
    validate_response(response)
    
    response = void()
    validate_response(response)
    
    end
    
it "should be able to run all Transaction Reporting sample code" do
    puts "Transaction Reporting START"

    response = get_batch_Statistics()
    validate_response(response)
    
    response = get_settled_batch_List()
    validate_response(response)
    
    response = get_transaction_Details()
    validate_response(response)
    
    puts "Get subscription status"
    response = get_transaction_List()
    validate_response(response)
    
    response = get_unsettled_transaction_List()
    validate_response(response)
    
    end
  
    
it "should be able to run all Visa Checkout sample code" do
    puts "Visa Checkout START"

#    response = create_visa_checkout_transaction()
#    validate_response(response)
    
    response = decrypt_visa_checkout_data()
    validate_response(response)
    
    end
    
it "should be able to run all Apple Pay sample code" do
    puts "Apple Pay START"

#    response = create_an_apple_pay_transaction()
#    validate_response(response)
#    
    end
    
    
end