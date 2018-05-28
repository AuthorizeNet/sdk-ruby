require "spec_helper"
include  AuthorizeNet::API

describe Transaction do
  before :all do
    begin
      creds = credentials
      @api_key = creds['api_transaction_key']
      @api_login = creds['api_login_id']
      @gateway = :sandbox
    rescue Errno::ENOENT => e
      @api_key = "TEST"
      @api_login = "TEST"
      warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
    end
  end

  before do
    @transaction = Transaction.new(@api_login, @api_key, gateway: @gateway)
    @amount = rand(100..10_099) / 100.0
    @expDate = '01' + (Time.now + (3600 * 24 * 365)).strftime('%y')
    @validCcNum = '4111111111111111'
    create_transaction_request
    create_transaction_response
  end

  it "should be able to run a test request" do
    @testRequest = AuthenticateTestRequest.new

    response = @transaction.authenticate_test_request(@testRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.messages.resultCode).to eq(MessageTypeEnum::Ok)

    transaction = Transaction.new(@api_login, @api_key, gateway: 'sandbox')
    response = transaction.authenticate_test_request(@testRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.messages.resultCode).to eq(MessageTypeEnum::Ok)
  end

  it "should be able to run credit card transaction" do
    @createTransactionRequest = CreateTransactionRequest.new
    @createTransactionRequest.transactionRequest = TransactionRequestType.new
    @createTransactionRequest.transactionRequest.amount = @amount
    @createTransactionRequest.transactionRequest.payment = PaymentType.new
    @createTransactionRequest.transactionRequest.payment.creditCard = CreditCardType.new(@validCcNum, @expDate, '123')
    @createTransactionRequest.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    response = @transaction.create_transaction(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.transactionResponse).not_to eq(nil)
  end

  it "should be able to run echeck transaction" do
    @createTransactionRequest = CreateTransactionRequest.new
    @createTransactionRequest.transactionRequest = TransactionRequestType.new
    @createTransactionRequest.transactionRequest.amount = @amount
    @createTransactionRequest.transactionRequest.payment = PaymentType.new
    @createTransactionRequest.transactionRequest.payment.bankAccount = BankAccountType.new("checking", "125000024", "123456789", "name", EcheckTypeEnum::WEB, "123", "123")
    @createTransactionRequest.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    response = @transaction.create_transaction(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.transactionResponse).not_to eq(nil)
  end

  it "should be able to run apple pay transaction" do
    @createTransactionRequest = CreateTransactionRequest.new
    @createTransactionRequest.transactionRequest = TransactionRequestType.new
    @createTransactionRequest.transactionRequest.amount = @amount
    @createTransactionRequest.transactionRequest.payment = PaymentType.new
    @createTransactionRequest.transactionRequest.payment.opaqueData = OpaqueDataType.new("dataDescriptor", "dataValue")
    @createTransactionRequest.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    response = @transaction.create_transaction(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.transactionResponse).not_to eq(nil)
  end

  it "should be able to run a Visa Checkout transaction" do
    @createTransactionRequest = CreateTransactionRequest.new
    @createTransactionRequest.transactionRequest = TransactionRequestType.new
    @createTransactionRequest.transactionRequest.amount = @amount
    @createTransactionRequest.transactionRequest.payment = PaymentType.new
    @createTransactionRequest.transactionRequest.payment.opaqueData = OpaqueDataType.new("dataDescriptor", "dataValue", "dataKey")
    @createTransactionRequest.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    response = @transaction.create_transaction(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.transactionResponse).not_to eq(nil)
  end

  it "should be able to run paypal transaction" do
    @createTransactionRequest = CreateTransactionRequest.new
    @createTransactionRequest.transactionRequest = TransactionRequestType.new
    @createTransactionRequest.transactionRequest.amount = @amount
    @createTransactionRequest.transactionRequest.payment = PaymentType.new
    @createTransactionRequest.transactionRequest.payment.payPal = PayPalType.new("123", "123", "123", "123", "123", "123")
    @createTransactionRequest.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    response = @transaction.create_transaction(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
  end

  it "should return error when connection is not available" do
    @transaction = Transaction.new(@api_login, @api_key, gateway: "wrong gateway")
    response = @transaction.create_transaction(@createTransactionRequest)
    expect(response).not_to eq(nil)
    expect(response).is_a? Exception
    expect(response.message).not_to eq(nil)
  end

  it "should be able to create a customer profile from existing transaction" do
    # create a transaction
    createTranReq = CreateTransactionRequest.new
    createTranReq.transactionRequest = TransactionRequestType.new
    createTranReq.transactionRequest.amount = @amount
    createTranReq.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    createTranReq.transactionRequest.payment = PaymentType.new
    createTranReq.transactionRequest.payment.creditCard = CreditCardType.new(@validCcNum, @expDate, '123')

    # customer info needed for profile
    createTranReq.transactionRequest.customer = CustomerDataType.new
    createTranReq.transactionRequest.customer.email = rand(1_000_000).to_s + "joe@somedomain.ddd"
    createTranReq.transactionRequest.customer.id = rand(1_000_000).to_s

    # send the request and get response
    createTranResp = @transaction.create_transaction(createTranReq)

    # validate the transaction was created
    expect(createTranResp.transactionResponse.transId).not_to eq("0")

    # create profile from this transaction
    createProfReq = CreateCustomerProfileFromTransactionRequest.new
    createProfReq.transId = createTranResp.transactionResponse.transId
    createProfResp = @transaction.create_customer_profile_from_transaction(createProfReq)

    expect(createProfResp).not_to eq(nil)
    unless createProfResp.messages.resultCode == MessageTypeEnum::Ok
      puts createProfResp.messages.messages[0].text
    end
    expect(createProfResp.messages.resultCode).to eq(MessageTypeEnum::Ok)
    expect(createProfResp.customerProfileId).not_to eq(nil)
    expect(createProfResp.customerPaymentProfileIdList).not_to eq(nil)

    # delete the profile for the test repeatability
    deleteProfReq = DeleteCustomerProfileRequest.new
    deleteProfReq.customerProfileId = createProfResp.customerProfileId
    @transaction.delete_customer_profile(deleteProfReq)
  end

  it "should be able to create a customer profile with a new transaction" do
    # create a transaction
    createTranReq = CreateTransactionRequest.new
    createTranReq.transactionRequest = TransactionRequestType.new
    createTranReq.transactionRequest.amount = @amount
    createTranReq.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    createTranReq.transactionRequest.payment = PaymentType.new
    createTranReq.transactionRequest.payment.creditCard = CreditCardType.new(@validCcNum, @expDate, '123')

    # customer info needed for profile
    createTranReq.transactionRequest.customer = CustomerDataType.new
    createTranReq.transactionRequest.customer.email = rand(1_000_000).to_s + "joe@somedomain.ddd"
    createTranReq.transactionRequest.customer.id = rand(1_000_000).to_s

    # set the "createProfile" flag to true
    createTranReq.transactionRequest.profile = CustomerProfilePaymentType.new
    createTranReq.transactionRequest.profile.createProfile = "true"

    # send the request and get response
    createTranResp = @transaction.create_transaction(createTranReq)

    # validate transaction was successful
    unless createTranResp.messages.resultCode == MessageTypeEnum::Ok
      puts createTranResp.messages.messages[0].text
    end
    expect(createTranResp.messages.resultCode).to eq(MessageTypeEnum::Ok)
    expect(createTranResp.transactionResponse.transId).not_to eq("0")

    # validate customer profile was created
    expect(createTranResp.profileResponse).not_to eq(nil)
    unless createTranResp.profileResponse.messages.resultCode == MessageTypeEnum::Ok
      puts createTranResp.profileResponse.messages.messages[0].text
    end
    expect(createTranResp.profileResponse.messages.resultCode).to eq(MessageTypeEnum::Ok)
    expect(createTranResp.profileResponse.customerProfileId).not_to eq("0")

    # delete customer profile for repeatability
    deleteProfReq = DeleteCustomerProfileRequest.new
    deleteProfReq.customerProfileId = createTranResp.profileResponse.customerProfileId
    @transaction.delete_customer_profile(deleteProfReq)
  end

  it "should serialize and deserialize CreateTransactionRequest" do
    expected = @createTransactionRequest.transactionRequest

    actual = get_actual(@createTransactionRequest, CreateTransactionRequest, Transaction::Type::API_CREATE_TRANSACTION).transactionRequest

    # validate all properties
    expected.amount.should == actual.amount
    expected.currencyCode.should == actual.currencyCode
    expected.authCode.should == actual.authCode
    expected.refTransId.should == actual.refTransId
    expected.splitTenderId.should == actual.splitTenderId
    expect(expected.taxExempt).to eq(actual.taxExempt)
    expected.poNumber.should == actual.poNumber
    expected.customerIP.should == actual.customerIP
    expected.transactionType.should == actual.transactionType

    # payment
    expected.payment.creditCard.cardNumber.should == actual.payment.creditCard.cardNumber
    expected.payment.creditCard.expirationDate.should == actual.payment.creditCard.expirationDate
    expected.payment.creditCard.isPaymentToken.should == actual.payment.creditCard.isPaymentToken
    expected.payment.creditCard.cardCode.should == actual.payment.creditCard.cardCode

    # CustomerProfilePaymentType
    expect(expected.profile.createProfile).to eq(actual.profile.createProfile)
    expected.profile.customerProfileId.should == actual.profile.customerProfileId
    expected.profile.shippingProfileId.should == actual.profile.shippingProfileId
    expected.profile.paymentProfile.paymentProfileId.should == actual.profile.paymentProfile.paymentProfileId
    expected.profile.paymentProfile.cardCode.should == actual.profile.paymentProfile.cardCode

    # Solution Type
    expected.solution.id.should == actual.solution.id
    expected.solution.name.should == actual.solution.name

    # OrderType
    expected.order.invoiceNumber.should == actual.order.invoiceNumber
    expected.order.description.should == actual.order.description

    # LineItemType
    expected.lineItems.lineItems.each_with_index do |item, index|
      item.itemId.should == actual.lineItems.lineItems[index].itemId
      item.name.should == actual.lineItems.lineItems[index].name
      item.description.should == actual.lineItems.lineItems[index].description
      item.quantity.should == actual.lineItems.lineItems[index].quantity
      item.unitPrice.should == actual.lineItems.lineItems[index].unitPrice
      expect(item.taxable).to eq(actual.lineItems.lineItems[index].taxable)
    end

    # Tax
    expected.tax.amount.should == actual.tax.amount
    expected.tax.name.should == actual.tax.name
    expected.tax.description.should == actual.tax.description

    # Duty
    expected.duty.amount.should == actual.duty.amount
    expected.duty.name.should == actual.duty.name
    expected.duty.description.should == actual.duty.description

    # Shipping
    expected.shipping.amount.should == actual.shipping.amount
    expected.shipping.name.should == actual.shipping.name
    expected.shipping.description.should == actual.shipping.description

    # CustomerDataType
    expected.customer.type.should == actual.customer.type
    expected.customer.id.should == actual.customer.id
    expected.customer.email.should == actual.customer.email
    expected.customer.taxId.should == actual.customer.taxId
    expected.customer.driversLicense.number.should == actual.customer.driversLicense.number
    expected.customer.driversLicense.state.should == actual.customer.driversLicense.state
    expected.customer.driversLicense.dateOfBirth.should == actual.customer.driversLicense.dateOfBirth

    # BillTo
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

    # ShipTo
    expected.shipTo.firstName.should == actual.shipTo.firstName
    expected.shipTo.lastName.should == actual.shipTo.lastName
    expected.shipTo.company.should == actual.shipTo.company
    expected.shipTo.address.should == actual.shipTo.address
    expected.shipTo.city.should == actual.shipTo.city
    expected.shipTo.state.should == actual.shipTo.state
    expected.shipTo.zip.should == actual.shipTo.zip
    expected.shipTo.country.should == actual.shipTo.country

    # CardHolderAuthentication
    expected.cardholderAuthentication.authenticationIndicator.should == actual.cardholderAuthentication.authenticationIndicator
    expected.cardholderAuthentication.cardholderAuthenticationValue.should == actual.cardholderAuthentication.cardholderAuthenticationValue

    # Retail
    expected.retail.marketType.should == actual.retail.marketType
    expected.retail.deviceType.should == actual.retail.deviceType

    # TransactionSettings
    expected.transactionSettings.settings.each_with_index do |item, index|
      item.settingName.should == actual.transactionSettings.settings[index].settingName
      item.settingValue.should == actual.transactionSettings.settings[index].settingValue
    end

    # UserFields
    expected.userFields.userFields.each_with_index do |item, index|
      item.name.should == actual.userFields.userFields[index].name
      item.value.should == actual.userFields.userFields[index].value
    end
  end

  it "should serialize and deserialize CreateTransactionResponse" do
    expected = @createTransactionResponse.transactionResponse

    actResponse = get_actual(@createTransactionResponse, CreateTransactionResponse, "createTransactionResponse")

    actual = actResponse.transactionResponse

    # validate
    @createTransactionResponse.refId.should == actResponse.refId
    @createTransactionResponse.sessionToken.should == actResponse.sessionToken
    @createTransactionResponse.messages.resultCode.should == actResponse.messages.resultCode
    @createTransactionResponse.messages.messages.each_with_index do |item, index|
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

    expected.messages.messages.each_with_index do |item, index|
      item.code.should == actual.messages.messages[index].code
      item.description.should == actual.messages.messages[index].description
    end

    expected.errors.errors.each_with_index do |item, index|
      item.errorCode.should == actual.errors.errors[index].errorCode
      item.errorText.should == actual.errors.errors[index].errorText
    end

    expected.splitTenderPayments.splitTenderPayments.each_with_index do |item, index|
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

    expected.userFields.userFields.each_with_index do |item, index|
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

    expected.secureAcceptance.SecureAcceptanceUrl.should == actual.secureAcceptance.SecureAcceptanceUrl
    expected.secureAcceptance.PayerID.should == actual.secureAcceptance.PayerID

    @createTransactionResponse.profileResponse.messages.resultCode.should == actResponse.profileResponse.messages.resultCode
    @createTransactionResponse.profileResponse.messages.messages.each_with_index do |item, index|
      item.code.should == actResponse.profileResponse.messages.messages[index].code
      item.text.should == actResponse.profileResponse.messages.messages[index].text
    end

    @createTransactionResponse.profileResponse.customerProfileId.should == actResponse.profileResponse.customerProfileId

    @createTransactionResponse.profileResponse.customerPaymentProfileIdList.numericString.each_with_index do |item, index|
      item.should == actResponse.profileResponse.customerPaymentProfileIdList.numericString[index]
    end

    @createTransactionResponse.profileResponse.customerShippingAddressIdList.numericString.each_with_index do |item, index|
      item.should == actResponse.profileResponse.customerShippingAddressIdList.numericString[index]
    end
  end

  it "should serialize and deserialize BankAccountType" do
    expected = BankAccountType.new("123", "123", "123", "name", EcheckTypeEnum::ARC, "123", "123")
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
    expected = CreditCardTrackType.new("track1", "track2")
    actual = get_actual(expected, CreditCardTrackType, "creditCardTrackType")

    expected.track1.should == actual.track1
    expected.track2.should == actual.track2
  end

  it "should serialize and deserialize PayPalType" do
    expected = PayPalType.new("123", "123", "123", "123", "123", "123")
    actual = get_actual(expected, PayPalType, "payPalType")

    expected.successUrl.should == actual.successUrl
    expected.cancelUrl.should == actual.cancelUrl
    expected.paypalLc.should == actual.paypalLc
    expected.paypalHdrImg.should == actual.paypalHdrImg
    expected.paypalPayflowcolor.should == actual.paypalPayflowcolor
    expected.payerID.should == actual.payerID
  end

  it "should serialize and deserialize OpaqueDataType" do
    expected = OpaqueDataType.new("dataDescriptor", "dataValue")
    actual = get_actual(expected, OpaqueDataType, "opaqueDataType")

    expected.dataDescriptor.should == actual.dataDescriptor
    expected.dataValue.should == actual.dataValue
  end

  it "should serialize and deserialize EncryptedTrackDataType" do
    expected = EncryptedTrackDataType.new
    expected.FormOfPayment = KeyBlock.new
    expected.FormOfPayment.Value = KeyValue.new
    expected.FormOfPayment.Value.Encoding = EncodingType::Base64
    expected.FormOfPayment.Value.EncryptionAlgorithm = EncryptionAlgorithmType::TDES
    expected.FormOfPayment.Value.Scheme = KeyManagementScheme.new
    expected.FormOfPayment.Value.Scheme.DUKPT = KeyManagementScheme::DUKPT.new

    expected.FormOfPayment.Value.Scheme.DUKPT.Operation = OperationType::DECRYPT
    expected.FormOfPayment.Value.Scheme.DUKPT.Mode = KeyManagementScheme::DUKPT::Mode.new("1234", "1234")
    expected.FormOfPayment.Value.Scheme.DUKPT.DeviceInfo = KeyManagementScheme::DUKPT::DeviceInfo.new("description")
    expected.FormOfPayment.Value.Scheme.DUKPT.EncryptedData = KeyManagementScheme::DUKPT::EncryptedData.new("bla")

    actual = get_actual(expected, EncryptedTrackDataType, "encryptedTrackDataType")

    expected.FormOfPayment.Value.Encoding.should == actual.FormOfPayment.Value.Encoding
    expected.FormOfPayment.Value.EncryptionAlgorithm.should == actual.FormOfPayment.Value.EncryptionAlgorithm
    expected.FormOfPayment.Value.Scheme.DUKPT.Operation.should == actual.FormOfPayment.Value.Scheme.DUKPT.Operation
    expected.FormOfPayment.Value.Scheme.DUKPT.Mode.PIN.should == actual.FormOfPayment.Value.Scheme.DUKPT.Mode.PIN
    expected.FormOfPayment.Value.Scheme.DUKPT.Mode.Data.should == actual.FormOfPayment.Value.Scheme.DUKPT.Mode.Data
    expected.FormOfPayment.Value.Scheme.DUKPT.DeviceInfo.Description.should == actual.FormOfPayment.Value.Scheme.DUKPT.DeviceInfo.Description
    expected.FormOfPayment.Value.Scheme.DUKPT.EncryptedData.Value.should == actual.FormOfPayment.Value.Scheme.DUKPT.EncryptedData.Value
  end

  it "should be able to get subscription" do
    transaction = AuthorizeNet::API::Transaction.new(@api_login, @api_key, gateway: @gateway)
    @createTransactionRequest = ARBGetSubscriptionRequest.new

    @createTransactionRequest.refId = 'Sample'
    @createTransactionRequest.subscriptionId = '2930242'

    transaction.should respond_to(:arb_get_subscription_request)
    response = transaction.arb_get_subscription_request(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.messages.resultCode).to eq(MessageTypeEnum::Ok)
    expect(response.subscription.name).not_to eq(nil)
    expect(response.subscription.paymentSchedule).not_to eq(nil)
    expect(response.subscription.profile).not_to eq(nil)
    expect(response.subscription.profile.paymentProfile).not_to eq(nil)
    expect(response.subscription.profile.paymentProfile.billTo).not_to eq(nil)
  end

  it "should be able to get Customer Payment Profile List Request" do
    transaction = AuthorizeNet::API::Transaction.new(@api_login, @api_key, gateway: @gateway)

    searchTypeEnum = CustomerPaymentProfileSearchTypeEnum::CardsExpiringInMonth
    sorting = CustomerPaymentProfileSorting.new
    orderByEnum = CustomerPaymentProfileOrderFieldEnum::Id
    sorting.orderBy = orderByEnum
    sorting.orderDescending = false

    paging = Paging.new
    paging.limit = 1000
    paging.offset = 1

    @createTransactionRequest = GetCustomerPaymentProfileListRequest.new

    @createTransactionRequest.searchType = searchTypeEnum
    @createTransactionRequest.month = "2020-12"
    @createTransactionRequest.sorting = sorting
    @createTransactionRequest.paging = paging

    transaction.should respond_to(:get_customer_payment_profile_list)
    response = transaction.get_customer_payment_profile_list(@createTransactionRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.messages.resultCode).to eq(MessageTypeEnum::Ok)
    expect(response.totalNumInResultSet).not_to eq(nil)
    expect(response.paymentProfiles.paymentProfile.length).not_to eq(0)
    expect(response.paymentProfiles.paymentProfile[0].billTo.firstName).not_to eq(nil)
    expect(response.paymentProfiles.paymentProfile[0].payment.creditCard.cardNumber).not_to eq(nil)
  end

  it "should be able to get transaction List Request" do
    transaction = AuthorizeNet::API::Transaction.new(@api_login, @api_key, gateway: @gateway)

    batchId = "4551107"

    @getTransactionListRequest = GetTransactionListRequest.new
    @getTransactionListRequest.batchId = batchId

    transaction.should respond_to(:get_transaction_list)
    response = transaction.get_transaction_list(@getTransactionListRequest)

    expect(response).not_to eq(nil)
    expect(response.messages).not_to eq(nil)
    expect(response.messages.resultCode).not_to eq(nil)
    expect(response.messages.resultCode).to eq(MessageTypeEnum::Ok)
    expect(response.transactions).not_to eq nil
  end

  def get_actual(expected, className, topElement)
    xmlText = @transaction.serialize(expected, topElement)
    className.from_xml(xmlText)
  end

  def create_transaction_request
    # create transaction request
    @createTransactionRequest = CreateTransactionRequest.new

    # all simple props
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
    tReq.payment.creditCard = CreditCardType.new('4111111111111111', '0515', "true", '123')

    tReq.transactionType = TransactionTypeEnum::AuthCaptureTransaction

    # CustomerProfilePaymentType
    tReq.profile = CustomerProfilePaymentType.new
    tReq.profile.createProfile = "true"
    tReq.profile.customerProfileId = 123
    tReq.profile.shippingProfileId = 123
    tReq.profile.paymentProfile = PaymentProfile.new(1_234_556_565_656_565_656_565_656, "056")

    # Solution Type
    tReq.solution = SolutionType.new("A1000005", "somesolution")

    # OrderType
    tReq.order = OrderType.new("invoiceNumber123", "description123")

    # LineItemType
    tReq.lineItems = LineItems.new([LineItemType.new("itemId123", "name123", "description123", 123, 45.67, "true"),
                                    LineItemType.new("itemId456", "name456", "description456", 456, 35.67, "false")])
    # ExtendedAmountType
    tReq.tax = ExtendedAmountType.new(11.32, "taxName", "taxDescription")
    tReq.duty = ExtendedAmountType.new(12.35, "dutyName", "dutyDescription")
    tReq.shipping = ExtendedAmountType.new(5.32, "shippingName", "shippingDescription")

    # CustomerDataType
    driversLicense = DriversLicenseType.new("DrivLicenseNumber123", "WA", "05/05/1990")
    tReq.customer = CustomerDataType.new(CustomerTypeEnum::Individual, "custId1", "a@a.com", driversLicense, "123456789")

    # BillTo
    tReq.billTo = CustomerAddressType.new("firstNameBT", "lastNameBT", "companyBT", "addressBT", "New York", "NY",
                                          "10010", "USA", "2121111111", "2121111111")
    # ShipTo
    tReq.shipTo = NameAndAddressType.new("firstNameST", "lastNameST", "companyST", "addressST", "New York", "NY",
                                         "10010", "USA")

    # CardHolderAuthentication
    tReq.cardholderAuthentication = CcAuthenticationType.new("authenticationIndicator1", "cardholderAuthenticationValue1")

    # TODO: add enums
    # Retail
    tReq.retail = TransRetailInfoType.new("2", "1")

    # TODO: add enums
    # TransactionSettings
    tReq.transactionSettings = Settings.new([SettingType.new("testRequest", "1"),
                                             SettingType.new("duplicateWindow", "0")])

    # UserFields
    tReq.userFields = UserFields.new([UserField.new("field1", "fieldValue1"), UserField.new("field2", "fieldValue2")])
  end

  def create_transaction_response
    @createTransactionResponse = CreateTransactionResponse.new
    @createTransactionResponse.refId = "someRefId123"
    @createTransactionResponse.sessionToken = "some session token"
    @createTransactionResponse.messages = MessagesType.new(MessageTypeEnum::Ok, [MessagesType::Message.new("code1", "text1"), MessagesType::Message.new("code2", "text2")])

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

    tResp.prePaidCard = TransactionResponse::PrePaidCard.new("123.33", "123.33", "123.33")
    tResp.messages = TransactionResponse::Messages.new([TransactionResponse::Messages::Message.new("code1", "descr1"), TransactionResponse::Messages::Message.new("code1", "descr1")])
    tResp.errors = TransactionResponse::Errors.new([TransactionResponse::Errors::Error.new("code1", "descr1"), TransactionResponse::Errors::Error.new("errorCode1", "errorDescr1")])
    tResp.splitTenderPayments = TransactionResponse::SplitTenderPayments.new
    tResp.splitTenderPayments.splitTenderPayments =
      [
        TransactionResponse::SplitTenderPayments::SplitTenderPayment.new("transId1", "responseCode1", "responseToCustomer1",
                                                                         "authCode1", "accountNumber1", "accountType1", "requestedAmount1", "approvedAmount1", "balanceOnCard1"),
        TransactionResponse::SplitTenderPayments::SplitTenderPayment.new("transId12", "responseCode12", "responseToCustomer12",
                                                                         "authCode12", "accountNumber12", "accountType12", "requestedAmount12", "approvedAmount12",
                                                                         "balanceOnCard12")
      ]

    tResp.userFields = UserFields.new([UserField.new("field1", "fieldValue1"), UserField.new("field2", "fieldValue2")])

    tResp.shipTo = shipTo = NameAndAddressType.new("firstNameST", "lastNameST", "companyST", "addressST", "New York", "NY",
                                                   "10010", "USA")
    tResp.secureAcceptance = TransactionResponse::SecureAcceptance.new("secureAcceptanceUrl1", "payerID1")

    @createTransactionResponse.profileResponse = CreateProfileResponse.new
    @createTransactionResponse.profileResponse.messages = MessagesType.new(MessageTypeEnum::Ok, [MessagesType::Message.new("pRespCode1", "pRespText1"), MessagesType::Message.new("pRespCode2", "pRespText2")])
    @createTransactionResponse.profileResponse.customerProfileId = "3154654646546"
    @createTransactionResponse.profileResponse.customerPaymentProfileIdList = NumericStringsType.new(%w[546654656465 5665656565656565])
    @createTransactionResponse.profileResponse.customerShippingAddressIdList = NumericStringsType.new(%w[66232546654656465 566565656565787876565])
  end
end
