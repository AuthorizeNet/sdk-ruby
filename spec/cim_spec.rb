require "spec_helper"

describe AuthorizeNet::CIM::Transaction do
  
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
    @chrs = [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
  end
  
  before do
    @gateway = :sandbox
    @credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '01' + (Time.now + (3600 * 24 * 365)).strftime('%y'))
    @profile = AuthorizeNet::CIM::CustomerProfile.new(:email => 'test@example.com', :id => (0..19).map{@chrs[rand(@chrs.length)]}.join)
    @address = AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe', :address => '123 Fake St', :city => 'Raccoon Junction', :state => 'WY', :zip => '99999')
    @partial_auth_address = AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe', :address => '123 Fake St', :city => 'Raccoon Junction', :state => 'WY', :zip => '46225')
    @payment_profile = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => @credit_card)
    @partial_auth_payment_profile = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => @credit_card, :billing_address => @partial_auth_address)
  end
  
  def create_profile(profile)
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:create_profile)
    response = transaction.create_profile(profile)
    response.success?.should be_true
    response.profile_id.nil?.should be_false
    return response.profile_id
  end
  
  def delete_profile(profile)
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = transaction.delete_profile(profile)
    response.success?.should be_true
  end
  
  it "should support instantiation" do
    AuthorizeNet::CIM::Transaction.new(@api_login, @api_key).should be_instance_of(AuthorizeNet::CIM::Transaction)
  end
  
  it "should not have a response if the transaction hasn't been run" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => @gateway)
    transaction.has_response?.should be_false
  end
  
  it "should support the returning its response object" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => @gateway)
    transaction.should respond_to(:response)
  end
  
  it "should know if its running against the sandbox or not" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.test?.should be_true
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :live)
    transaction.test?.should be_false
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => 'moose')
    transaction.test?.should be_true
  end
  
  it "should be able to create customer profiles" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:create_profile)
    response = transaction.create_profile(@profile)
    response.success?.should be_true
    response.profile_id.nil?.should be_false
    response.address_ids.nil?.should be_true
    response.payment_profile_ids.nil?.should be_true
    response.validation_responses.nil?.should be_true
  end
  
  it "should be able to create customer profiles with payment profiles included" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:create_profile)
    @profile.payment_profiles = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => @credit_card)
    response = transaction.create_profile(@profile)
    response.success?.should be_true
    response.profile_id.nil?.should be_false
    response.address_ids.nil?.should be_true
    response.payment_profile_ids.nil?.should be_false
    response.validation_responses.nil?.should be_true
  end
  
  it "should be able to create customer profiles with payment profiles included and validated" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:create_profile)
    @profile.payment_profiles = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => @credit_card)
    response = transaction.create_profile(@profile, :validation_mode => :testMode)
    response.success?.should be_true
    response.profile_id.nil?.should be_false
    response.address_ids.nil?.should be_true
    response.payment_profile_ids.nil?.should be_false
    valdiation_responses = response.validation_responses
    valdiation_responses.nil?.should be_false
    valdiation_responses.length.should == 1
    valdiation_responses[0].should be_instance_of(AuthorizeNet::AIM::Response)
    valdiation_responses[0].success?.should be_true
  end
  
  it "should be able to delete customer profiles" do
    # create a profile to delete
    profile_id = create_profile(@profile)
    
    # delete it
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:delete_profile)
    response = transaction.delete_profile(profile_id)
    response.success?.should be_true
  end
  
  it "should be able to retrieve customer profiles" do
    # create a profile to fetch
    @profile.payment_profiles = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => @credit_card)
    profile_id = create_profile(@profile)
    
    # fetch the profile
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_profile)
    response = transaction.get_profile(profile_id)
    response.success?.should be_true
    profile = response.profile
    profile.should be_instance_of(AuthorizeNet::CIM::CustomerProfile)
    profile.payment_profiles.length.should == 1
    profile.payment_profiles.first.should be_instance_of(AuthorizeNet::CIM::PaymentProfile)
    
    # delete it
    delete_profile(profile)
  end
  
  it "should be able to update customer profiles" do
    # build a profile
    profile_id = create_profile(@profile)
    
    @profile.customer_profile_id = profile_id
    @profile.fax = '5551112222'
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:update_profile)
    response = transaction.update_profile(@profile)
    response.success?.should be_true
    
    delete_profile(profile_id)
  end
  
  describe "performing actions on payment profiles" do
    
    def create_payment_profile(payment_profile, profile, validation_mode = :none)
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:create_payment_profile)
      response = transaction.create_payment_profile(payment_profile, profile, :validation_mode => validation_mode)
      response.success?.should be_true
      response.payment_profile_id.nil?.should be_false
      response.validation_responses.nil?.should be_true
      return response.payment_profile_id
    end
    
    before do
      @profile.customer_profile_id = create_profile(@profile)
      @payment_profile.customer_payment_profile_id = create_payment_profile(@payment_profile, @profile)
    end
    
    after do
      delete_profile(@profile)
    end
    
    it "should be able to create payment profiles" do
      # handled by our before/after filters
    end

    it "should be able to delete payment profiles" do
      # delete the payment profile
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:delete_payment_profile)
      response = transaction.delete_payment_profile(@payment_profile, @profile)
      response.success?.should be_true
    end

    it "should be able to retrieve payment profiles" do
      # get the payment profile
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_payment_profile)
      response = transaction.get_payment_profile(@payment_profile, @profile)
      response.success?.should be_true
      response.payment_profile.should be_kind_of(AuthorizeNet::CIM::PaymentProfile)
    end

    it "should be able to update payment profiles" do
      @payment_profile.cust_type = :business

      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:update_payment_profile)
      response = transaction.update_payment_profile(@payment_profile, @profile)
      response.success?.should be_true
    end
    
    it "should be able to validate payment profiles" do
      @payment_profile.cust_type = :business

      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:update_payment_profile)
      response = transaction.update_payment_profile(@payment_profile, @profile, :validation_mode => :testMode)
      response.success?.should be_true
      response.validation_response.nil?.should be_false
      response.validation_response.should be_instance_of(AuthorizeNet::AIM::Response)
      response.validation_response.success?.should be_true
    end
    
    describe "should be able to create payment transactions" do
      
      before do
        @amount = (rand(10000) + 100) / 100.0
      end
      
      it "should support authorization and capture transactions" do
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        transaction.should respond_to(:create_transaction_auth_capture)
        response = transaction.create_transaction_auth_capture(@amount, @profile, @payment_profile, AuthorizeNet::Order.new())
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
        direct_response.success?.should be_true
      end
      
      it "should support authorization only transactions" do
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        transaction.should respond_to(:create_transaction_auth_only)
        response = transaction.create_transaction_auth_only(@amount, @profile, @payment_profile, AuthorizeNet::Order.new())
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
        direct_response.success?.should be_true
      end
      
      it "should support prior authorization capture transactions" do
        # create an auth only transaction
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_only(@amount + 10, @profile, @payment_profile, AuthorizeNet::Order.new())
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.success?.should be_true
        
        # capture it
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        transaction.should respond_to(:create_transaction_prior_auth_capture)
        response = transaction.create_transaction_prior_auth_capture(direct_response.transaction_id, @amount)
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
        direct_response.success?.should be_true
      end
      
      it "should support voiding a transaction" do
        # create a transaction
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, @profile, @payment_profile, AuthorizeNet::Order.new())
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.success?.should be_true
        
        # void it
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        transaction.should respond_to(:create_transaction_void)
        response = transaction.create_transaction_void(direct_response.transaction_id)
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
        direct_response.success?.should be_true
      end
      
      it "should support refunding a transaction"
      #this test won't be created.  It requires overnight settlement in order to work.

      it "should support capture only transactions"
      
      it "should be able to support multiple payment profiles" do
        @partial_auth_payment_profile.customer_payment_profile_id = create_payment_profile(@partial_auth_payment_profile, @profile)
        @partial_auth_payment_profile.customer_payment_profile_id.nil?.should be_false
      end
      
      it "should support validating a payment profile" do
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        transaction.should respond_to(:validate_payment_profile)
        response = transaction.validate_payment_profile(@payment_profile, @profile)
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
        direct_response.success?.should be_true
      end
      
      it "should support custom delimiters" do
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, @profile, @payment_profile, AuthorizeNet::Order.new(), :aim_options => {:delim_char => '$'})
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.success?.should be_true
      end
      
      it "should support custom fields" do
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, @profile, @payment_profile, AuthorizeNet::Order.new(), :custom_fields => {:foo => '123', :bar => '456'})
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.success?.should be_true
        direct_response.custom_fields[:foo].should == '123'
        direct_response.custom_fields[:bar].should == '456'
      end
      
      it "should support custom fields with custom delimeters" do
        transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, @profile, @payment_profile, AuthorizeNet::Order.new(), :custom_fields => {:foo => '123', :bar => '456'}, :aim_options => {:delim_char => '$'})
        response.success?.should be_true
        direct_response = response.direct_response
        direct_response.success?.should be_true
        direct_response.custom_fields[:foo].should == '123'
        direct_response.custom_fields[:bar].should == '456'
      end
      
      describe "should be able to update split transaction statuses" do
        
        before do
          # create partial payment profile
          @partial_auth_payment_profile.customer_payment_profile_id = create_payment_profile(@partial_auth_payment_profile, @profile)

          # create partial payment transaciton
          transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
          transaction.should respond_to(:create_transaction_auth_capture)
          response = transaction.create_transaction_auth_capture(@amount, @profile, @partial_auth_payment_profile, AuthorizeNet::Order.new(), :aim_options => {:allow_partial_auth => true})
          response.success?.should be_true
          direct_response = response.direct_response
          direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
          direct_response.success?.should be_false
          direct_response.response_code.should == AuthorizeNet::AIM::Response::ResponseCode::HELD
          direct_response.fields[:amount].should == 1.23
          direct_response.fields[:split_tender_id].nil?.should be_false
          new_amount = @amount - direct_response.fields[:amount]
          @split_tender_id = direct_response.fields[:split_tender_id]

          # create transaction for the remaining value

          transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
          transaction.should respond_to(:create_transaction_auth_capture)
          response = transaction.create_transaction_auth_capture(new_amount, @profile, @partial_auth_payment_profile, AuthorizeNet::Order.new(), :aim_options => {:split_tender_id => @split_tender_id})
          response.success?.should be_true
          direct_response = response.direct_response
          direct_response.should be_instance_of(AuthorizeNet::AIM::Response)
          direct_response.success?.should be_true
        end
        
        it "should be able to complete a split transaction" do
          transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
          transaction.should respond_to(:update_split_tender)
          response = transaction.update_split_tender(@split_tender_id, :completed)
          response.success?.should be_true
        end
        
        it "should be able to void a split transaction" do
          transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
          transaction.should respond_to(:update_split_tender)
          response = transaction.update_split_tender(@split_tender_id, :voided)
          response.success?.should be_true
        end
      end
    end
  end
  
  describe "performing actions on addresses" do
    
    def create_address(address, profile)
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:create_address)
      response = transaction.create_address(address, profile)
      response.success?.should be_true
      response.address_id.nil?.should be_false

      return response.address_id
    end
    
    before do
      @profile.customer_profile_id = create_profile(@profile)
      @address.customer_address_id = create_address(@address, @profile)
    end
    
    after do
      delete_profile(@profile)
    end
    
    it "should be able to create addresses" do
      # our before and after filters handle it all
    end
    
    it "should be able to delete addresses" do
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:delete_address)
      response = transaction.delete_address(@address, @profile)
      response.success?.should be_true
    end

    it "should be able to retrieve addresses" do
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_address)
      response = transaction.get_address(@address, @profile)
      response.success?.should be_true
      response.address.should be_kind_of(AuthorizeNet::Address)
    end
    
    it "should be able to update addresses" do
      @address.zip = '55555'
      transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:update_address)
      response = transaction.update_address(@address, @profile)
      response.success?.should be_true
    end
    
  end
  
  it "should be able to get all profile ids" do
    transaction = AuthorizeNet::CIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_profile_ids)
    response = transaction.get_profile_ids
    response.should be_kind_of(AuthorizeNet::CIM::Response)
    response.success?.should be_true
    response.profile_ids.nil?.should be_false
  end
end

describe AuthorizeNet::CIM::Response do
  
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
    
  end
  
  it "should support instantiation" do
    AuthorizeNet::CIM::Response.new('', nil).should be_instance_of(AuthorizeNet::CIM::Response)
  end
end
