require "spec_helper"
include  AuthorizeNet::API

describe Transaction do
  
  before :all do
    begin
      creds = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")
      @api_key = creds['api_transaction_key']
      @api_login = creds['api_login_id']
      @gateway = :sandbox
      @transaction = Transaction.new(@api_login, @api_key, :gateway => @gateway)
    rescue Errno::ENOENT => e
      @api_key = "TEST"
      @api_login = "TEST"
      warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
    end
  end

  before do
    create_transaction_request
    create_transaction_response
  end
   
  it "should serialize and deserialize CreateTransactionRequest" do
    expected = @createTransactionRequest.transactionRequest

    actual = get_actual(@createTransactionRequest,CreateTransactionRequest,Transaction::Type::API_CREATE_TRANSACTION).transactionRequest 
     
    #validate all properties 
    expected.amount.should == actual.amount
    expected.currencyCode.should == actual.currencyCode
    expected.authCode.should == actual.authCode
    expected.refTransId.should == actual.refTransId
    expected.splitTenderId.should == actual.splitTenderId
    expect(expected.taxExempt).to eq(actual.taxExempt)
    expected.poNumber.should == actual.poNumber
    expected.customerIP.should == actual.customerIP
    expected.transactionType.should == actual.transactionType
    
    #payment
    expected.payment.creditCard.cardNumber.should == actual.payment.creditCard.cardNumber
    expected.payment.creditCard.expirationDate.should == actual.payment.creditCard.expirationDate
    expected.payment.creditCard.paymentToken.should == actual.payment.creditCard.paymentToken
    expected.payment.creditCard.cardCode.should == actual.payment.creditCard.cardCode
    
    #CustomerProfilePaymentType
    expect(expected.profile.createProfile).to eq(actual.profile.createProfile)
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
      expect(item.taxable).to eq(actual.lineItems.lineItems[index].taxable)
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
  
  it "should serialize and deserialize CreateTransactionResponse" do 
    expected = @createTransactionResponse.transactionResponse
    
    actResponse = get_actual(@createTransactionResponse,CreateTransactionResponse,"createTransactionResponse")
    
    actual = actResponse.transactionResponse
    
    #validate
    @createTransactionResponse.refId.should == actResponse.refId
    @createTransactionResponse.sessionToken.should == actResponse.sessionToken
    @createTransactionResponse.messages.resultCode.should == actResponse.messages.resultCode
    @createTransactionResponse.messages.messages.each_with_index do |item,index|
      item.code.should == actResponse.messages.messages[index].code
      item.text.should == actResponse.messages.messages[index].text
    end

    expected.responseCode.should == actual.responseCode
    expected.rawResponseCode.should == actual.rawResponseCode
    expected.authCode.should == actual.authCode
    expected.avsResultCode.should == actual.avsResultCode
    expected.cvvResultCode.should == actual.cvvResultCode
    expected.cavvResultCode.should == actual.cavvResultCode
    expected.transId.should == actual.transId
    expected.refTransID.should == actual.refTransID
    expected.transHash.should == actual.transHash
    expected.testRequest.should == actual.testRequest
    expected.accountNumber.should == actual.accountNumber
    expected.accountType.should == actual.accountType
    expected.splitTenderId.should == actual.splitTenderId
   
    expected.prePaidCard.requestedAmount.should == actual.prePaidCard.requestedAmount
    expected.prePaidCard.approvedAmount.should == actual.prePaidCard.approvedAmount
    expected.prePaidCard.balanceOnCard.should == actual.prePaidCard.balanceOnCard

    expected.messages.messages.each_with_index do |item,index|
      item.code.should == actual.messages.messages[index].code
      item.description.should == actual.messages.messages[index].description
    end
  
    expected.errors.errors.each_with_index do |item,index|
      item.errorCode.should == actual.errors.errors[index].errorCode
      item.errorText.should == actual.errors.errors[index].errorText
    end
                           
    expected.splitTenderPayments.splitTenderPayments.each_with_index do |item,index|
      item.transId.should == actual.splitTenderPayments.splitTenderPayments[index].transId
      item.responseCode.should == actual.splitTenderPayments.splitTenderPayments[index].responseCode
      item.responseToCustomer.should == actual.splitTenderPayments.splitTenderPayments[index].responseToCustomer
      item.authCode.should == actual.splitTenderPayments.splitTenderPayments[index].authCode
      item.accountNumber.should == actual.splitTenderPayments.splitTenderPayments[index].accountNumber
      item.accountType.should == actual.splitTenderPayments.splitTenderPayments[index].accountType
      item.requestedAmount.should == actual.splitTenderPayments.splitTenderPayments[index].requestedAmount
      item.approvedAmount.should == actual.splitTenderPayments.splitTenderPayments[index].approvedAmount
      item.balanceOnCard.should == actual.splitTenderPayments.splitTenderPayments[index].balanceOnCard
    end
    
    expected.userFields.userFields.each_with_index do |item,index|
      item.name.should == actual.userFields.userFields[index].name
      item.value.should == actual.userFields.userFields[index].value
    end
                                                                  
    expected.shipTo.firstName.should == actual.shipTo.firstName
    expected.shipTo.lastName.should == actual.shipTo.lastName
    expected.shipTo.company.should == actual.shipTo.company
    expected.shipTo.address.should == actual.shipTo.address
    expected.shipTo.city.should == actual.shipTo.city
    expected.shipTo.state.should == actual.shipTo.state
    expected.shipTo.zip.should == actual.shipTo.zip
    expected.shipTo.country.should == actual.shipTo.country
    
    expected.secureAcceptance.secureAcceptanceUrl.should == actual.secureAcceptance.secureAcceptanceUrl
    expected.secureAcceptance.payerID.should == actual.secureAcceptance.payerID

    @createTransactionResponse.profileResponse.messages.resultCode.should == actResponse.profileResponse.messages.resultCode
    @createTransactionResponse.profileResponse.messages.messages.each_with_index do |item,index|
      item.code.should == actResponse.profileResponse.messages.messages[index].code
      item.text.should == actResponse.profileResponse.messages.messages[index].text
    end
    
    @createTransactionResponse.profileResponse.customerProfileId.should == actResponse.profileResponse.customerProfileId

    @createTransactionResponse.profileResponse.customerPaymentProfileIdList.numericStrings.each_with_index do |item,index|
      item.should == actResponse.profileResponse.customerPaymentProfileIdList.numericStrings[index]
    end
    
    @createTransactionResponse.profileResponse.customerShippingAddressIdList.numericStrings.each_with_index do |item,index|
      item.should == actResponse.profileResponse.customerShippingAddressIdList.numericStrings[index]
    end
  end
  
  it "should serialize and deserialize BankAccountType" do
    expected = BankAccountType.new("123","123","123","name",EcheckTypeEnum::ARC,"123","123")
    actual = get_actual(expected, BankAccountType, "bankAccountType")
    
    expected.accountType.should == actual.accountType
    expected.routingNumber.should == actual.routingNumber
    expected.accountNumber.should == actual.accountNumber
    expected.nameOnAccount.should == actual.nameOnAccount
    expected.echeckType.should == actual.echeckType
    expected.bankName.should == actual.bankName
    expected.checkNumber.should == actual.checkNumber
  end 
 
  it "should serialize and deserialize CreditCardTrackType" do
    expected = CreditCardTrackType.new("track1","track2")
    actual = get_actual(expected, CreditCardTrackType, "creditCardTrackType")
    
    expected.track1.should == actual.track1
    expected.track2.should == actual.track2
  end
  
  it "should serialize and deserialize PayPalType" do
    expected = PayPalType.new("123","123","123","123","123","123")
    actual = get_actual(expected, PayPalType, "payPalType")
    
    expected.successUrl.should == actual.successUrl
    expected.cancelUrl.should == actual.cancelUrl
    expected.paypalLc.should == actual.paypalLc
    expected.paypalHdrImg.should == actual.paypalHdrImg
    expected.paypalPayflowcolor.should == actual.paypalPayflowcolor
    expected.payerID.should == actual.payerID
  end
  
  it "should serialize and deserialize OpaqueDataType" do
    expected = OpaqueDataType.new("dataDescriptor","dataValue")
    actual = get_actual(expected, OpaqueDataType, "opaqueDataType")
    
    expected.dataDescriptor.should == actual.dataDescriptor
    expected.dataValue.should == actual.dataValue
  end
  
  it "should serialize and deserialize EncryptedTrackDataType" do
    expected = EncryptedTrackDataType.new
    expected.formOfPayment = KeyBlock.new
    expected.formOfPayment.value = KeyValue.new
    expected.formOfPayment.value.encoding = EncodingType::Base64
    expected.formOfPayment.value.encryptionAlgorithm = EncryptionAlgorithmType::TDES
    expected.formOfPayment.value.scheme = KeyManagementScheme.new
    expected.formOfPayment.value.scheme.dUKPT = KeyManagementScheme::DUKPT.new
    
    expected.formOfPayment.value.scheme.dUKPT.operation = OperationType::DECRYPT
    expected.formOfPayment.value.scheme.dUKPT.mode = KeyManagementScheme::DUKPT::Mode.new("1234","1234")
    expected.formOfPayment.value.scheme.dUKPT.deviceInfo = KeyManagementScheme::DUKPT::DeviceInfo.new("description")
    expected.formOfPayment.value.scheme.dUKPT.encryptedData = KeyManagementScheme::DUKPT::EncryptedData.new("bla")
    
    actual = get_actual(expected, EncryptedTrackDataType, "encryptedTrackDataType")
    
    expected.formOfPayment.value.encoding.should == actual.formOfPayment.value.encoding
    expected.formOfPayment.value.encryptionAlgorithm.should == actual.formOfPayment.value.encryptionAlgorithm
    expected.formOfPayment.value.scheme.dUKPT.operation.should == actual.formOfPayment.value.scheme.dUKPT.operation
    expected.formOfPayment.value.scheme.dUKPT.mode.pIN.should == actual.formOfPayment.value.scheme.dUKPT.mode.pIN
    expected.formOfPayment.value.scheme.dUKPT.mode.data.should == actual.formOfPayment.value.scheme.dUKPT.mode.data
    expected.formOfPayment.value.scheme.dUKPT.deviceInfo.description.should == actual.formOfPayment.value.scheme.dUKPT.deviceInfo.description
    expected.formOfPayment.value.scheme.dUKPT.encryptedData.value.should == actual.formOfPayment.value.scheme.dUKPT.encryptedData.value
  end
  
  #todo: return errors
  it "should be able to run test credit card transaction" do
    #remove data that is not valid for this request
    @createTransactionRequest.transactionRequest.profile = nil
    @createTransactionRequest.transactionRequest.cardholderAuthentication = nil
    @createTransactionRequest.transactionRequest.splitTenderId = nil
    response = @transaction.create_transaction(@createTransactionRequest)
     
    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)     
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.transactionResponse).not_to eq(nil)     
  end

  it "should be able to run test echeck transaction" do
    @createTransactionRequest.transactionRequest.profile = nil
    @createTransactionRequest.transactionRequest.cardholderAuthentication = nil
    @createTransactionRequest.transactionRequest.splitTenderId = nil
    
    @createTransactionRequest.transactionRequest.payment.creditCard = nil
    @createTransactionRequest.transactionRequest.payment.bankAccount = BankAccountType.new("checking","125000024","123456789","name",EcheckTypeEnum::WEB,"123","123")
    
    response = @transaction.create_transaction(@createTransactionRequest)
    
    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil) 
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.transactionResponse).not_to eq(nil)     
  end

  def get_actual(expected, className, topElement)
    xmlText = @transaction.serialize(expected,topElement)
    className.from_xml(xmlText)
  end
  
  def create_transaction_request
    #create transaction request
    @createTransactionRequest = CreateTransactionRequest.new
    
    #all simple props
    @createTransactionRequest.transactionRequest = TransactionRequestType.new
    tReq = @createTransactionRequest.transactionRequest
    tReq.amount = 37.55
    tReq.currencyCode = "USD"
    tReq.authCode = "1546"
    tReq.refTransId = "123"
    tReq.splitTenderId = "123"
    tReq.taxExempt = "true"
    tReq.poNumber = "12345"
    tReq.customerIP = "12345"
    
    tReq.payment = PaymentType.new
    tReq.payment.creditCard = CreditCardType.new('4111111111111111','0515',"true",'123') 
    
    tReq.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    
    #CustomerProfilePaymentType
    tReq.profile = CustomerProfilePaymentType.new
    tReq.profile.createProfile = "true"
    tReq.profile.customerProfileId = 123
    tReq.profile.shippingProfileId = 123
    tReq.profile.paymentProfile = PaymentProfile.new(1234556565656565656565656,"056")
    
    #Solution Type
    #TODO: check usage
    tReq.solution = SolutionType.new("A1000005","somesolution")
    
    #OrderType
    tReq.order = OrderType.new("invoiceNumber123","description123")
    
    #LineItemType
    tReq.lineItems = LineItems.new([LineItemType.new("itemId123","name123","description123",123,45.67,"true"),
                                            LineItemType.new("itemId456","name456","description456",456,35.67,"false")])
    #ExtendedAmountType                                        
    tReq.tax = ExtendedAmountType.new(11.32,"taxName","taxDescription")
    tReq.duty = ExtendedAmountType.new(12.35,"dutyName","dutyDescription")
    tReq.shipping = ExtendedAmountType.new(5.32,"shippingName","shippingDescription")
    
    #CustomerDataType
    driversLicense = DriversLicenseType.new("DrivLicenseNumber123","WA","05/05/1990")
    tReq.customer = CustomerDataType.new(CustomerTypeEnum::Individual,"custId1","a@a.com",driversLicense,"123456789")
    
    #BillTo                                              
    tReq.billTo = CustomerAddressType.new("firstNameBT","lastNameBT","companyBT","addressBT","New York","NY",
          "10010","USA","2121111111","2121111111")
    #ShipTo                                              
    tReq.shipTo = NameAndAddressType.new("firstNameST","lastNameST","companyST","addressST","New York","NY",
          "10010","USA")
    
    #CardHolderAuthentication
    tReq.cardholderAuthentication = CcAuthenticationType.new("authenticationIndicator1","cardholderAuthenticationValue1")
    
    #TODO: add enums
    #Retail
    tReq.retail  = TransRetailInfoType.new("2","1")
  
    #TODO: add enums  
    #TransactionSettings
    tReq.transactionSettings = Settings.new([SettingType.new("testRequest","1"),
                                                                   SettingType.new("duplicateWindow","0")])
    
    #UserFields
    tReq.userFields = UserFields.new([UserField.new("field1","fieldValue1"),UserField.new("field2","fieldValue2")])
  end
  
  def create_transaction_response
    @createTransactionResponse = CreateTransactionResponse.new
    @createTransactionResponse.refId = "someRefId123"
    @createTransactionResponse.sessionToken = "some session token"
    @createTransactionResponse.messages = MessagesType.new(MessageTypeEnum::Ok,[MessagesType::Message.new("code1","text1"),MessagesType::Message.new("code2","text2")])
    
    @createTransactionResponse.transactionResponse = TransactionResponse.new
    tResp = @createTransactionResponse.transactionResponse
    tResp.responseCode = "123"
    tResp.rawResponseCode = "123"
    tResp.authCode = "123"
    tResp.avsResultCode = "123"
    tResp.cvvResultCode = "123"
    tResp.cavvResultCode = "123"
    tResp.transId = "123"
    tResp.refTransID = "123"
    tResp.transHash = "123"
    tResp.testRequest = "123"
    tResp.accountNumber = "123"
    tResp.accountType = "123"
    tResp.splitTenderId = "123"
    
    tResp.prePaidCard = TransactionResponse::PrePaidCard.new("123.33","123.33","123.33")
    tResp.messages = TransactionResponse::Messages.new([TransactionResponse::Messages::Message.new("code1","descr1"),TransactionResponse::Messages::Message.new("code1","descr1")])     
    tResp.errors = TransactionResponse::Errors.new([TransactionResponse::Errors::Error.new("code1","descr1"),TransactionResponse::Errors::Error.new("errorCode1","errorDescr1")])                          
    tResp.splitTenderPayments = TransactionResponse::SplitTenderPayments.new
    tResp.splitTenderPayments.splitTenderPayments = 
          [
             TransactionResponse::SplitTenderPayments::SplitTenderPayment.new("transId1","responseCode1","responseToCustomer1",
               "authCode1", "accountNumber1", "accountType1", "requestedAmount1", "approvedAmount1", "balanceOnCard1"),
            TransactionResponse::SplitTenderPayments::SplitTenderPayment.new("transId12","responseCode12","responseToCustomer12",
                           "authCode12", "accountNumber12", "accountType12", "requestedAmount12", "approvedAmount12", 
                           "balanceOnCard12") ]
    
    tResp.userFields = UserFields.new([UserField.new("field1","fieldValue1"),UserField.new("field2","fieldValue2")])
    
    tResp.shipTo = shipTo = NameAndAddressType.new("firstNameST","lastNameST","companyST","addressST","New York","NY",
                                                                      "10010","USA")
    tResp.secureAcceptance = TransactionResponse::SecureAcceptance.new("secureAcceptanceUrl1","payerID1")

    @createTransactionResponse.profileResponse = CreateProfileResponse.new
    @createTransactionResponse.profileResponse.messages = MessagesType.new(MessageTypeEnum::Ok,[MessagesType::Message.new("pRespCode1","pRespText1"),MessagesType::Message.new("pRespCode2","pRespText2")])
    @createTransactionResponse.profileResponse.customerProfileId = "3154654646546"
    @createTransactionResponse.profileResponse.customerPaymentProfileIdList = ArrayOfNumericString.new([546654656465,5665656565656565])
    @createTransactionResponse.profileResponse.customerShippingAddressIdList = ArrayOfNumericString.new([66232546654656465,566565656565787876565])
  end
end