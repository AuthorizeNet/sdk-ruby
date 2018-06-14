require "spec_helper"

describe AuthorizeNet::SIM::Transaction do
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
    @amount = 10.00
    @fingerprint = 'a8ea7b27729daf76d4a67bdb7d0a2fa3'
    @sequence = '123456789'
    @timestamp = '987654321'
  end

  it "should support instantiation" do
    AuthorizeNet::SIM::Transaction.new(@api_login, @api_key, @amount).should be_instance_of(AuthorizeNet::SIM::Transaction)
  end

  it "should generate a correct fingerprint" do
    transaction = AuthorizeNet::SIM::Transaction.new('TEST', 'TEST', @amount, sequence: @sequence, timestamp: @timestamp)
    transaction.fingerprint.should == @fingerprint
  end

  it "should provide the actual values used to build the fingerprint" do
    transaction = AuthorizeNet::SIM::Transaction.new('TEST', 'TEST', @amount)
    hash = transaction.fingerprint_fields
    transaction2 = AuthorizeNet::SIM::Transaction.new('TEST', 'TEST', @amount, sequence: hash[:fp_sequence], timestamp: hash[:fp_timestamp])
    hash[:fp_hash].should == transaction2.fingerprint
  end

  it "should provide a hash of all the form fields, ready for conversion to HTML" do
    transaction = AuthorizeNet::SIM::Transaction.new('TEST', 'TEST', @amount)
    transaction.form_fields.should be_kind_of(Hash)
    transaction.form_fields.should have_key(:x_fp_hash)
  end

  it "should know if its in test mode" do
    transaction = AuthorizeNet::SIM::Transaction.new(@api_login, @api_key, @amount, test: true)
    transaction.test?.should be_truthy
    transaction = AuthorizeNet::SIM::Transaction.new(@api_login, @api_key, @amount, test: false)
    transaction.test?.should be_falsey
  end
end

describe AuthorizeNet::SIM::Response do
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
    @amount = rand(100..10_099) / BigDecimal.new(100)
    @fingerprint = 'a8ea7b27729daf76d4a67bdb7d0a2fa3'
    @sequence = '123456789'
    @timestamp = '987654321'
  end

  it "should support instantiation" do
    AuthorizeNet::SIM::Response.new('').should be_instance_of(AuthorizeNet::SIM::Response)
  end

  it "should support parsing the response into fields" do
    response = AuthorizeNet::SIM::Response.new('x_first_name=John&x_last_name=Doe')
    response.fields.should have_key(:first_name)
    response.fields.should have_key(:last_name)
  end

  it "should be able to build a Direct Post Method URL with fields from the response" do
    response = AuthorizeNet::SIM::Response.new('x_first_name=John&x_last_name=Doe')
    response.direct_post_url('http://www.example.com/').should == 'http://www.example.com/?x_first_name=John&x_last_name=Doe'
  end
end

describe AuthorizeNet::SIM::HostedPaymentForm do
  it "should support instantiation" do
    AuthorizeNet::SIM::HostedPaymentForm.new.should be_instance_of(AuthorizeNet::SIM::HostedPaymentForm)
  end
end
