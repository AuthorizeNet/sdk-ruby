require "spec_helper"

describe AuthorizeNet do

  it "should have a module called AuthorizeNet" do
    defined?(AuthorizeNet).should be_truthy
    AuthorizeNet.class.should equal(Module)
  end
  
  it "should have a module called AIM" do
    defined?(AuthorizeNet::AIM).should be_truthy
    AuthorizeNet::AIM.class.should equal(Module)
  end

end

describe AuthorizeNet::CreditCard do
  
  before do
    @card_number = '4111111111111111'
    @expiry = '01' + (Time.now + (3600 * 24 * 365)).strftime('%y')
  end
  
  it "should support instantiation" do
    AuthorizeNet::CreditCard.new(@card_number, @expiry).should be_instance_of(AuthorizeNet::CreditCard)
  end
  
  it "should support converting itself into a hash" do
    card = AuthorizeNet::CreditCard.new(@card_number, @expiry)
    card.should respond_to(:to_hash)
    card.to_hash.should be_kind_of(Hash)
  end
  
  it "should have the right payment method type" do
    card = AuthorizeNet::CreditCard.new(@card_number, @expiry)
    fields = card.to_hash
    fields[:method].should == AuthorizeNet::PaymentMethodType::CREDIT_CARD
  end
  
  it "should respond to attributes" do
    card = AuthorizeNet::CreditCard.new(@card_number, @expiry)
    card.card_number.should == @card_number
    card.expiration.should == @expiry
    card.card_code.should be_nil
  end

  it 'should clean the track' do
    card = AuthorizeNet::CreditCard.new(@card_number, @expiry, track_1: '%1111111111111111=11111111111111111111?3', track_2: ';2222222222222222=22222222222222222222?3')
    card_hash = card.to_hash
    expect(card_hash[:track_1]).to eq('1111111111111111=11111111111111111111')
    expect(card_hash[:track_2]).to eq('2222222222222222=22222222222222222222')

    card = AuthorizeNet::CreditCard.new(@card_number, @expiry, track_1: '1111111111111111=11111111111111111111', track_2: '2222222222222222=22222222222222222222')
    card_hash = card.to_hash
    expect(card_hash[:track_1]).to eq('1111111111111111=11111111111111111111')
    expect(card_hash[:track_2]).to eq('2222222222222222=22222222222222222222')
  end
end

describe AuthorizeNet::ECheck do
  
  before do
    @routing_number = '322271627'
    @account_number = '123456789'
    @bank_name = 'JPMorgan Chase Bank'
    @account_holder_name = 'John Doe'
  end
  
  it "should support instantiation" do
    AuthorizeNet::ECheck.new(@routing_number, @account_number, @bank_name, @account_holder_name).should be_instance_of(AuthorizeNet::ECheck)
  end
  
  it "should support converting itself into a hash" do
    echeck = AuthorizeNet::ECheck.new(@routing_number, @account_number, @bank_name, @account_holder_name)
    echeck.should respond_to(:to_hash)
    echeck.to_hash.should be_kind_of(Hash)
  end
  
  it "should support payment method code retrival" do
    echeck = AuthorizeNet::ECheck.new(@routing_number, @account_number, @bank_name, @account_holder_name)
    fields = echeck.to_hash
    fields[:method].should == AuthorizeNet::PaymentMethodType::ECHECK
  end
end

describe AuthorizeNet::Address do
  
  before do
  end
  
  it "should support instantiation" do
    AuthorizeNet::Address.new.should be_instance_of(AuthorizeNet::Address)
  end
  
  it "should support converting itself into a hash" do
    address = AuthorizeNet::Address.new
    address.should respond_to(:to_hash)
    address.to_hash.should be_kind_of(Hash)
  end
  
  it "should ignore unknown fields" do
    address = AuthorizeNet::Address.new(:tax => '123')
    hash = address.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {}
  end
  
  it "should accept known fields" do
    address = AuthorizeNet::Address.new(:first_name => '123')
    hash = address.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {:first_name => '123'}
  end
end

describe AuthorizeNet::ShippingAddress do
  
  before do
  end
  
  it "should support instantiation" do
    AuthorizeNet::ShippingAddress.new.should be_instance_of(AuthorizeNet::ShippingAddress)
  end
  
  it "should support converting itself into a hash" do
    address = AuthorizeNet::ShippingAddress.new
    address.should respond_to(:to_hash)
    address.to_hash.should be_kind_of(Hash)
  end
  
  it "should ignore unknown fields" do
    address = AuthorizeNet::ShippingAddress.new(:pie => '123')
    hash = address.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {}
  end
  
  it "should accept known fields" do
    address = AuthorizeNet::ShippingAddress.new(:first_name => '123')
    hash = address.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {:ship_to_first_name => '123'}
  end
end

describe AuthorizeNet::Customer do
  
  before do
  end
  
  it "should support instantiation" do
    AuthorizeNet::Customer.new.should be_instance_of(AuthorizeNet::Customer)
  end
  
  it "should support converting itself into a hash" do
    customer = AuthorizeNet::Customer.new
    customer.should respond_to(:to_hash)
    customer.to_hash.should be_kind_of(Hash)
  end
  
  it "should ignore unknown fields" do
    customer = AuthorizeNet::Customer.new(:name => '123')
    hash = customer.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {}
  end
  
  it "should accept known fields" do
    customer = AuthorizeNet::Customer.new(:id => '123')
    hash = customer.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {:cust_id => '123'}
  end
  
  it "should accept an address record" do
    address = AuthorizeNet::Address.new(:first_name => 'Tester', :last_name => 'Testerson')
    customer = AuthorizeNet::Customer.new(:address => address)
    hash = customer.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {:first_name => 'Tester', :last_name => 'Testerson'}
  end
end

describe AuthorizeNet::EmailReceipt do
  
  before do
  end
  
  it "should support instantiation" do
    AuthorizeNet::EmailReceipt.new.should be_instance_of(AuthorizeNet::EmailReceipt)
  end
  
  it "should support converting itself into a hash" do
    email = AuthorizeNet::EmailReceipt.new
    email.should respond_to(:to_hash)
    email.to_hash.should be_kind_of(Hash)
  end
  
  it "should ignore unknown fields" do
    email = AuthorizeNet::EmailReceipt.new(:name => '123')
    hash = email.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {}
  end
  
  it "should accept known fields" do
    email = AuthorizeNet::EmailReceipt.new(:header => '123')
    hash = email.to_hash
    hash.should be_kind_of(Hash)
    hash.should == {:header => '123'}
  end
end
