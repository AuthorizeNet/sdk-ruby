require "spec_helper"

describe AuthorizeNet::AIM::Transaction do
  before :all do
    begin
      creds = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")
      @api_key = creds['api_transaction_key']
      @api_login = creds['api_login_id']
      @md5_value = creds['md5_value']
      @solution_id = "AAA100302"
    rescue Errno::ENOENT => e
      @api_key = "TEST"
      @api_login = "TEST"
      @md5_value = "TEST"
      warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
    end
  end

  before do
    @type = AuthorizeNet::AIM::Transaction::Type::AUTHORIZE_AND_CAPTURE
    @test_mode = false
    @gateway = :sandbox
    @amount = rand(100..10_099) / BigDecimal.new(100)
    @next_year = "#{(Time.now.year+1) % 100}"
    @credit_card = AuthorizeNet::CreditCard.new('4111111111111111', "01#{@next_year}")
    @response = '1,1,1,(TESTMODE) This transaction has been approved.,000000,P,0,,,10.00,CC,auth_capture,,,,,,,,,,,,,,,,,,,,,,,,,,7A3C09A367FED29C9902038440CD8A52,,,,,,,,,,,,,XXXX0027,Visa,,,,,,,,,,,,,,,,'
    @echeck = AuthorizeNet::ECheck.new('322271627', '123456789', 'JPMorgan Chase Bank', 'John Doe')
  end

  it "should support instantiation" do
    AuthorizeNet::AIM::Transaction.new(@api_login, @api_key).should be_instance_of(AuthorizeNet::AIM::Transaction)
  end

  it "should know if its in test mode" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: AuthorizeNet::AIM::Transaction::Gateway::TEST, test: true)
    transaction.test?.should be_truthy
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: AuthorizeNet::AIM::Transaction::Gateway::TEST, test: false)
    transaction.test?.should be_truthy
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: AuthorizeNet::AIM::Transaction::Gateway::LIVE, test: true)
    transaction.test?.should be_truthy
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: AuthorizeNet::AIM::Transaction::Gateway::LIVE, test: false)
    transaction.test?.should be_falsey
  end

  it "should not have a response if the transaciton hasn't been run" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.has_response?.should be_falsey
  end

  it "should support the addition of fields to the transaction body" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.should respond_to(:set_fields)
    transaction.set_fields(test: 123).should == { test: 123 }
  end

  it "should support the addition of mulitple line_item fields" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.set_fields(line_item: [123, 123]).should == { line_item: [123, 123] }
    transaction.set_fields(line_item: "abc").should == { line_item: "abc" }
  end

  it "should not support the addition of mulitple fields for non-line-item fields" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.set_fields(test: 123).should == { test: 123 }
    transaction.set_fields(test: 123).should == { test: 123 }
  end

  it "should support custom fields" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.should respond_to(:set_custom_fields)
    transaction.set_custom_fields(test: 123).should == { test: 123 }
    transaction.fields.should == {}
    transaction.custom_fields.should == { test: 123 }
  end

  it "should support the returning its response object" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.should respond_to(:response)
  end

  it "should parse the response properly" do
    Net::HTTP.stub(:start).and_return(@response)
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    response = transaction.purchase(@amount, @credit_card)
    response.should be_kind_of(AuthorizeNet::AIM::Response)
    response.transaction_id.length.should >= 3
    response.success?.should be_truthy
    response.avs_response.should == AuthorizeNet::AIM::Response::AVSResponseCode::ADDRESS_AND_ZIP5_MATCH
    response.card_type.should == AuthorizeNet::AIM::Response::CardType::VISA
    response.card_type.should_not == AuthorizeNet::AIM::Response::CardType::MASTER_CARD
  end

  it "should support different transaction types" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.should respond_to(:type)
    transaction.type.should == AuthorizeNet::AIM::Transaction::Type::AUTHORIZE_AND_CAPTURE
    transaction.type = AuthorizeNet::AIM::Transaction::Type::VOID
    transaction.type.should == AuthorizeNet::AIM::Transaction::Type::VOID
    transaction.type = AuthorizeNet::AIM::Transaction::Type::AUTHORIZE_ONLY
    transaction.type.should == AuthorizeNet::AIM::Transaction::Type::AUTHORIZE_ONLY
    transaction.type = AuthorizeNet::AIM::Transaction::Type::CAPTURE_ONLY
    transaction.type.should == AuthorizeNet::AIM::Transaction::Type::CAPTURE_ONLY
    transaction.type = AuthorizeNet::AIM::Transaction::Type::CREDIT
    transaction.type.should == AuthorizeNet::AIM::Transaction::Type::CREDIT
    transaction.type = AuthorizeNet::AIM::Transaction::Type::PRIOR_AUTHORIZATION_AND_CAPTURE
    transaction.type.should == AuthorizeNet::AIM::Transaction::Type::PRIOR_AUTHORIZATION_AND_CAPTURE
  end

  it "should be able to run a transaction" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.run.should be_kind_of(AuthorizeNet::AIM::Response)
  end

  it "should not be able to run a transaction a second time" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.run.should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.run.should be_nil
  end

  it "should be able to make a purchase" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.fields[:amount].should == @amount
    transaction.response.success?.should be_truthy
  end

  it "should support custom fields in the response" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.set_custom_fields(funkey: '123')
    transaction.set_custom_fields(winker: 'ABC')
    transaction.set_custom_fields(bean: '!!!')
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    fields = transaction.response.custom_fields
    fields.should have_key(:funkey)
    fields[:funkey].should == '123'
    fields.should have_key(:winker)
    fields[:winker].should == 'ABC'
    fields.should have_key(:bean)
    fields[:bean].should == '!!!'
  end

  it "should support an encapsulation character in the response" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode, encapsulation_character: '"')
    transaction.set_custom_fields(funkey: '12,3')
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    fields = transaction.response.custom_fields
    fields.should have_key(:funkey)
    fields[:funkey].should == '12,3'
  end

  it "should accept an ECheck for a purchase" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.purchase(@amount, @echeck).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
  end

  it "should support adding line items" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.add_line_item("item1", "Foo", "Bar", "5", "5.00", "TRUE")
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
    transaction.fields[:line_item].should == ["item1<|>Foo<|>Bar<|>5<|>5.00<|>TRUE"]
  end

  it "should support setting a customer" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    customer = AuthorizeNet::Customer.new(ip: '127.0.0.1')
    transaction.set_customer(customer)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
  end

  it "should support setting an address" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    address = AuthorizeNet::Address.new(city: 'San Francisco', state: 'NY')
    transaction.set_address(address)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
  end

  it "should support setting a shipping address" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    address = AuthorizeNet::ShippingAddress.new(city: 'San Francisco', state: 'NY', tax: 10.00)
    transaction.set_shipping_address(address)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
  end

  it "should support setting solution id" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode, solution_id: @solution_id)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
    fields = transaction.response.transaction
    (defined?(fields.solution_id) && (fields.solution_id == 'AAA100302')).should be_truthy
  end

  it "should support adding an email receipt" do
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    email = AuthorizeNet::EmailReceipt.new(header: 'TEST!')
    transaction.set_email_receipt(email)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
  end

  it "should be able to void a purchase" do
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: false)
    purchase.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    purchase.response.fields[:amount].should == @amount
    purchase.response.success?.should be_truthy
    void = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: @gateway, test: false)
    void.void(purchase.response.transaction_id)
    void.response.success?.should be_truthy
  end

  it "should be able to capture a prior authorization" do
    auth = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: false)
    auth.authorize(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    auth.response.fields[:amount].should == @amount
    auth.response.success?.should be_truthy
    capture = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: @gateway, test: false)
    capture.prior_auth_capture(auth.response.transaction_id)
    capture.response.success?.should be_truthy
  end

  it "should be able to run a card present purchase with track 1 data" do
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_1: "%B4111111111111111^DOE/JOHN^#{@next_year}03101000000000020000831000000?")
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
  end

  it "should be able to run a card present purchase with LRC codes in the track 1 data" do
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_1: '%B4111111111111111^DOE/JOHN^'+@next_year+'03101000000000020000831000000?\xAA')
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
  end

  it "should be able to run a card present purchase with no LRC or Start/End Sentinels in track 1 data" do
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_1: "B4111111111111111^DOE/JOHN^#{@next_year}03101000000000020000831000000")
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
  end

  it "should be able to run a card present purchase with track 2 data" do
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_2: ';4111111111111111='+@next_year+'101000020000831?')
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
  end

  it "should be able to run a card present purchase with LRC codes in the track 2 data" do
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_2: ";4111111111111111=#{@next_year}03101000020000831?\x33")
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
  end

  it "should be able to run a card present purchase with no LRC or Start/End Sentinels in track 2 data" do
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_2: "4111111111111111=#{@next_year}03101000020000831")
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
  end

  it "should be able to validate the passed MD5 hash" do
    skip
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, transaction_type: @type, gateway: @gateway, test: @test_mode)
    transaction.purchase(@amount, @credit_card).should be_kind_of(AuthorizeNet::AIM::Response)
    transaction.response.success?.should be_truthy
    transaction.response.valid_md5?(@api_login, @md5_value).should be_truthy
  end

  it "should be able to validate the passed MD5 hash for card present transactions" do
    skip
    @credit_card = AuthorizeNet::CreditCard.new(nil, nil, track_1: '%B4111111111111111^DOE/JOHN^'+@next_year+'03101000000000020000831000000?')
    purchase = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, gateway: :card_present_test, test: false)
    response = purchase.purchase(@amount, @credit_card)
    response.success?.should be_truthy
    response.valid_md5?(@api_login, @md5_value).should be_truthy
  end
end

describe AuthorizeNet::AIM::Response do
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
    @cim_response = '1,1,1,This transaction has been approved.,000000,Y,2000000000,none,Test transaction for ValidateCustomerPaymentProfile.,0.01,CC,auth_only,custId123,John,Doe,,123 Main St.,Bellevue,WA,98004,USA,000-000-0000,,mark@example.com,,,,,,,,,0.00,0.00,0.00,,none,D18EB6B211FE0BBF556B271FDA6F92EE,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'
  end

  it "should support a Nokogiri based raw_response" do
    builder = Nokogiri::XML::Builder.new(encoding: 'utf-8') do |x|
      x.directResponse(@cim_response)
    end
    @element = builder.doc.children[0]
    @element.should be_kind_of(Nokogiri::XML::Element)
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, test: false)
    response = AuthorizeNet::AIM::Response.new(@element, transaction)
    response.success?.should be_truthy
    response.response_reason_text.should == 'This transaction has been approved.'
  end
end
