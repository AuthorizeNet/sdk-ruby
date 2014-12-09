require "spec_helper"
include  AuthorizeNet::API

describe Transaction do
  
  before :all do
    begin
      creds = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")
      @api_key = creds['api_transaction_key']
      @api_login = creds['api_login_id']
    rescue Errno::ENOENT => e
      @api_key = "TEST"
      @api_login = "TEST"
      warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
    end
  end

  before do
    @gateway = :sandbox
    @createTransactionRequest = CreateTransactionRequest.new()
    
    #all simple props
    @createTransactionRequest.transactionRequest = TransactionRequestType.new()
    @createTransactionRequest.transactionRequest.amount = 37.55
    @createTransactionRequest.transactionRequest.currencyCode = "USD"
    @createTransactionRequest.transactionRequest.authCode = "1546"
    @createTransactionRequest.transactionRequest.refTransId = "123"
    @createTransactionRequest.transactionRequest.splitTenderId = "123"
    @createTransactionRequest.transactionRequest.taxExempt = true
    @createTransactionRequest.transactionRequest.poNumber = "12345"
    @createTransactionRequest.transactionRequest.customerIP = "12345"
    
    @createTransactionRequest.transactionRequest.payment = PaymentType.new()
    @createTransactionRequest.transactionRequest.payment.creditCard = CreditCardType.new('4111111111111111','0515','123','123') 
    
    @createTransactionRequest.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    
    #CustomerProfilePaymentType
    @createTransactionRequest.transactionRequest.profile = CustomerProfilePaymentType.new()
    @createTransactionRequest.transactionRequest.profile.createProfile = true
    @createTransactionRequest.transactionRequest.profile.customerProfileId = '123abc'
    @createTransactionRequest.transactionRequest.profile.shippingProfileId = '123abc'
    @createTransactionRequest.transactionRequest.profile.paymentProfile = PaymentProfile.new("12345rr","456da")
    
    #Solution Type
    @createTransactionRequest.transactionRequest.solution = SolutionType.new("id123","name123")
    
    #OrderType
    @createTransactionRequest.transactionRequest.order = OrderType.new("invoiceNumber123","description123")
    
    #LineItemType
    @createTransactionRequest.transactionRequest.lineItems = LineItems.new([LineItemType.new("itemId123","name123","description123",123,45.67,true),
                                            LineItemType.new("itemId456","name456","description456",456,35.67,false)])
    #ExtendedAmountType                                        
    @createTransactionRequest.transactionRequest.tax = ExtendedAmountType.new(11.32,"taxName","taxDescription")
    @createTransactionRequest.transactionRequest.duty = ExtendedAmountType.new(12.35,"dutyName","dutyDescription")
    @createTransactionRequest.transactionRequest.shipping = ExtendedAmountType.new(5.32,"shippingName","shippingDescription")
    
    #CustomerDataType
    driversLicense = DriversLicenseType.new("DrivLicenseNumber123","WA","05/05/1990")
    @createTransactionRequest.transactionRequest.customer = CustomerDataType.new(CustomerTypeEnum::Individual,"custId1",
                                                  "a@a.com",driversLicense,"1234567")
    
    #BillTo                                              
    @createTransactionRequest.transactionRequest.billTo = CustomerAddressType.new("firstNameBT","lastNameBT","companyBT","addressBT","New York","NY",
          "10010","USA","2121111111","2121111111")
    #ShipTo                                              
    @createTransactionRequest.transactionRequest.shipTo = NameAndAddressType.new("firstNameST","lastNameST","companyST","addressST","New York","NY",
          "10010","USA")
    
    #CardHolderAuthentication
    @createTransactionRequest.transactionRequest.cardholderAuthentication = CcAuthenticationType.new("authenticationIndicator1","cardholderAuthenticationValue1")
    
    #Retail
    @createTransactionRequest.transactionRequest.retail  = TransRetailInfoType.new("some market type","some device type")
    
    #TransactionSettings
    @createTransactionRequest.transactionRequest.transactionSettings = Settings.new([SettingType.new("setting1","value1"),
                                                                   SettingType.new("setting2","value2")])
    
    #UserFields
    @createTransactionRequest.transactionRequest.userFields = UserFields.new([UserField.new("field1","fieldValue1"),UserField.new("field2","fieldValue2")])
  end
  
  it "should support instantiation" do
    Transaction.new(@api_login, @api_key).should be_instance_of(Transaction)
  end
  
  it "should support serialization and deserialization" do
    transaction = Transaction.new(@api_login, @api_key, :gateway => @gateway)
    
    #serialize request to xml
    xmlText = transaction.serialize(@createTransactionRequest,Transaction::Type::API_CREATE_TRANSACTION)
    
    #deserialize back to object
    expected = @createTransactionRequest.transactionRequest
    actual = CreateTransactionRequest.from_xml(xmlText).transactionRequest    
     
    #validate all properties 
    expected.amount.should == actual.amount
    expected.currencyCode.should == actual.currencyCode
    expected.authCode.should == actual.authCode
    expected.refTransId.should == actual.refTransId
    expected.splitTenderId.should == actual.splitTenderId
    #expected.taxExempt.should == actual.taxExempt
    expected.poNumber.should == actual.poNumber
    expected.customerIP.should == actual.customerIP
    expected.transactionType.should == actual.transactionType
    
    #payment
    expected.payment.creditCard.cardNumber.should == actual.payment.creditCard.cardNumber
    expected.payment.creditCard.expirationDate.should == actual.payment.creditCard.expirationDate
    expected.payment.creditCard.paymentToken.should == actual.payment.creditCard.paymentToken
    expected.payment.creditCard.cardCode.should == actual.payment.creditCard.cardCode
    
    #CustomerProfilePaymentType
    #expected.profile.createProfile.should == actual.profile.createProfile
    expected.profile.customerProfileId.should == actual.profile.customerProfileId
    expected.profile.shippingProfileId.should == actual.profile.shippingProfileId
    expected.profile.paymentProfile.paymentProfileId.should == actual.profile.paymentProfile.paymentProfileId
    expected.profile.paymentProfile.cardCode.should == actual.profile.paymentProfile.cardCode
    
    
    #Solution Type
    expected.solution.id.should == actual.solution.id
    expected.solution.name.should == actual.solution.name
    
    #OrderType
    expected.order.invoiceNumber.should == actual.order.invoiceNumber
    expected.order.description.should == actual.order.description
    
    #LineItemType
    expected.lineItems.lineItems.each_with_index do |item,index|
      item.itemId.should == actual.lineItems.lineItems[index].itemId
      item.name.should == actual.lineItems.lineItems[index].name
      item.description.should == actual.lineItems.lineItems[index].description
      item.quantity.should == actual.lineItems.lineItems[index].quantity
      item.unitPrice.should == actual.lineItems.lineItems[index].unitPrice
      #item.taxable.should == actual.lineItems.lineItems[index].taxable
    end

    #Tax                                        
    expected.tax.amount.should == actual.tax.amount
    expected.tax.name.should == actual.tax.name
    expected.tax.description.should == actual.tax.description
    
    #Duty
    expected.duty.amount.should == actual.duty.amount
    expected.duty.name.should == actual.duty.name
    expected.duty.description.should == actual.duty.description
    
    #Shipping
    expected.shipping.amount.should == actual.shipping.amount
    expected.shipping.name.should == actual.shipping.name
    expected.shipping.description.should == actual.shipping.description
    
    #CustomerDataType                                        
    expected.customer.type.should == actual.customer.type
    expected.customer.id.should == actual.customer.id
    expected.customer.email.should == actual.customer.email
    expected.customer.taxId.should == actual.customer.taxId
    expected.customer.driversLicense.number.should == actual.customer.driversLicense.number
    expected.customer.driversLicense.state.should == actual.customer.driversLicense.state
    expected.customer.driversLicense.dateOfBirth.should == actual.customer.driversLicense.dateOfBirth

    #BillTo                                              
    expected.billTo.firstName.should == actual.billTo.firstName
    expected.billTo.lastName.should == actual.billTo.lastName
    expected.billTo.company.should == actual.billTo.company
    expected.billTo.address.should == actual.billTo.address
    expected.billTo.city.should == actual.billTo.city
    expected.billTo.state.should == actual.billTo.state
    expected.billTo.zip.should == actual.billTo.zip
    expected.billTo.country.should == actual.billTo.country
    expected.billTo.phoneNumber.should == actual.billTo.phoneNumber
    expected.billTo.faxNumber.should == actual.billTo.faxNumber

    #ShipTo                                              
    expected.shipTo.firstName.should == actual.shipTo.firstName
    expected.shipTo.lastName.should == actual.shipTo.lastName
    expected.shipTo.company.should == actual.shipTo.company
    expected.shipTo.address.should == actual.shipTo.address
    expected.shipTo.city.should == actual.shipTo.city
    expected.shipTo.state.should == actual.shipTo.state
    expected.shipTo.zip.should == actual.shipTo.zip
    expected.shipTo.country.should == actual.shipTo.country
    
    #CardHolderAuthentication
    expected.cardholderAuthentication.authenticationIndicator.should == actual.cardholderAuthentication.authenticationIndicator
    expected.cardholderAuthentication.cardholderAuthenticationValue.should == actual.cardholderAuthentication.cardholderAuthenticationValue
    
    #Retail
    expected.retail.marketType.should == actual.retail.marketType
    expected.retail.deviceType.should == actual.retail.deviceType
    
    #TransactionSettings
    expected.transactionSettings.settings.each_with_index do |item,index|
      item.settingName.should == actual.transactionSettings.settings[index].settingName
      item.settingValue.should == actual.transactionSettings.settings[index].settingValue
    end
    
    #UserFields
    expected.userFields.userFields.each_with_index do |item,index|
      item.name.should == actual.userFields.userFields[index].name
      item.value.should == actual.userFields.userFields[index].value
    end
  end
end