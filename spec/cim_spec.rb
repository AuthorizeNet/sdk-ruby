require "spec_helper"

describe AuthorizeNet::CIM::Transaction do

  let(:api_key) { credentials['api_transaction_key'] }
  let(:api_login) { credentials['api_login_id'] }
  let(:chrs) { [('a'..'z'),('A'..'Z'),('0'..'9')].map(&:to_a).flatten }
  let(:gateway) { :sandbox }
  let(:credit_card) { AuthorizeNet::CreditCard.new('4111111111111111', '01' + (Time.now + (3600 * 24 * 365)).strftime('%y')) }
  let(:profile) { AuthorizeNet::CIM::CustomerProfile.new(:email => 'test@example.com', :id => (0..19).map{chrs[rand(chrs.length)]}.join) }
  let(:address) { AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe', :address => '123 Fake St', :city => 'Raccoon Junction', :state => 'WY', :zip => '99999') }
  let(:partial_auth_address) { AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe', :address => '123 Fake St', :city => 'Raccoon Junction', :state => 'WY', :zip => '46225') }
  let(:payment_profile) { AuthorizeNet::CIM::PaymentProfile.new(:payment_method => credit_card) }
  let(:partial_auth_payment_profile) { AuthorizeNet::CIM::PaymentProfile.new(:payment_method => credit_card, :billing_address => partial_auth_address) }

  def create_profile(profile)
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:create_profile)
    response = transaction.create_profile(profile)
    expect(response.success?).to eq true
    expect(response.profile_id).not_to eq nil
    return response.profile_id
  end
  
  def delete_profile(profile)
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    response = transaction.delete_profile(profile)
    expect(response.success?).to eq true
  end
  
  it "should support instantiation" do
    expect(AuthorizeNet::CIM::Transaction.new(api_login, api_key)).to be_instance_of(AuthorizeNet::CIM::Transaction)
  end
  
  it "should not have a response if the transaction hasn't been run" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => gateway)
    expect(transaction.has_response?).to eq false
  end
  
  it "should support the returning its response object" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => gateway)
    expect(transaction).to respond_to(:response)
  end
  
  it "should know if its running against the sandbox or not" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction.test?).to eq true
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :live)
    expect(transaction.test?).to eq false
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => 'moose')
    expect(transaction.test?).to eq true
  end
  
  it "should be able to create customer profiles" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:create_profile)
    response = transaction.create_profile(profile)
    expect(response.success?).to eq true
    expect(response.profile_id).not_to eq nil
    expect(response.address_ids).to eq nil
    expect(response.payment_profile_ids).to eq nil
    expect(response.validation_responses).to eq nil
  end
  
  it "should be able to create customer profiles with payment profiles included" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:create_profile)
    profile.payment_profiles = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => credit_card)
    response = transaction.create_profile(profile)
    expect(response.success?).to eq true
    expect(response.profile_id).not_to eq nil
    expect(response.address_ids).to eq nil
    expect(response.payment_profile_ids).not_to eq nil
    expect(response.validation_responses).to eq nil
  end
  
  it "should be able to create customer profiles with payment profiles included and validated" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:create_profile)
    profile.payment_profiles = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => credit_card)
    response = transaction.create_profile(profile, :validation_mode => :testMode)
    expect(response.success?).to eq true
    expect(response.profile_id).not_to eq nil
    expect(response.address_ids).to eq nil
    expect(response.payment_profile_ids).not_to eq nil
    valdiation_responses = response.validation_responses
    expect(valdiation_responses).not_to eq nil
    expect(valdiation_responses.length).to eq 1
    expect(valdiation_responses[0]).to be_instance_of(AuthorizeNet::AIM::Response)
    expect(valdiation_responses[0].success?).to eq true
  end
  
  it "should be able to delete customer profiles" do
    # create a profile to delete
    profile_id = create_profile(profile)

    # delete it
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:delete_profile)
    response = transaction.delete_profile(profile_id)
    expect(response.success?).to eq true
  end
  
  it "should be able to retrieve customer profiles" do
    # create a profile to fetch
    profile.payment_profiles = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => credit_card)
    profile_id = create_profile(profile)
    
    # fetch the profile
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:get_profile)
    response = transaction.get_profile(profile_id)
    expect(response.success?).to eq true
    profile = response.profile
    expect(profile).to be_instance_of(AuthorizeNet::CIM::CustomerProfile)
    expect(profile.payment_profiles.length).to eq 1
    expect(profile.payment_profiles.first).to be_instance_of(AuthorizeNet::CIM::PaymentProfile)
    
    # delete it
    delete_profile(profile)
  end
  
  it "should be able to update customer profiles" do
    # build a profile
    profile_id = create_profile(profile)
    
    profile.customer_profile_id = profile_id
    profile.fax = '5551112222'
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:update_profile)
    response = transaction.update_profile(profile)
    expect(response.success?).to eq true
    
    delete_profile(profile_id)
  end

  it "should be able to receive hosted profile access token" do
    # build a profile
    profile_id = create_profile(profile)

    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:get_hosted_profile_token)

    response = transaction.get_hosted_profile_token(profile_id)

    expect(response.success?).to eq true
    expect(response.token).not_to be_empty
  end
  it "should be able to add line items to the order" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    #build a order with line item
    order = AuthorizeNet::Order.new().add_line_item(101,'Abc','Xyz',2,25.2,1)
    expect(order[0].id).to eq 101
    expect(order[0].name).to eq 'Abc'
    expect(order[0].description).to eq 'Xyz'
    expect(order[0].quantity).to eq 2
    expect(order[0].price).to eq 25.2
    expect(order[0].taxable).to eq 1
    
  end
  describe "performing actions on payment profiles" do
    
    def create_payment_profile(payment_profile, profile, validation_mode = :none)
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:create_payment_profile)
      response = transaction.create_payment_profile(payment_profile, profile, :validation_mode => validation_mode)
      expect(response.success?).to eq true
      expect(response.payment_profile_id).not_to eq nil
      expect(response.validation_responses).to eq nil
      return response.payment_profile_id
    end
    
    before do
      profile.customer_profile_id = create_profile(profile)
      payment_profile.customer_payment_profile_id = create_payment_profile(payment_profile, profile)
    end
    
    after do
      delete_profile(profile)
    end
    
    it "should be able to create payment profiles" do
      # handled by our before/after filters
    end
    
    it "should be able to delete payment profiles" do
      # delete the payment profile
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:delete_payment_profile)
      response = transaction.delete_payment_profile(payment_profile, profile)
      expect(response.success?).to eq true
    end

    it "should be able to retrieve payment profiles" do
      # get the payment profile
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:get_payment_profile)
      response = transaction.get_payment_profile(payment_profile, profile)
      expect(response.success?).to eq true
      expect(response.payment_profile).to be_kind_of(AuthorizeNet::CIM::PaymentProfile)
    end

    it "should be able to update payment profiles" do
      payment_profile.cust_type = :business

      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:update_payment_profile)
      response = transaction.update_payment_profile(payment_profile, profile)
      expect(response.success?).to eq true
    end
    
    it "should be able to update payment profiles with a masked exp date" do
      payment_profile.cust_type = :business

      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:update_payment_profile)
      @credit_card_with_masked_exp_date = AuthorizeNet::CreditCard.new('4111111111111111', 'XXXX')
      payment_profile.payment_method = @credit_card_with_masked_exp_date
      
      response = transaction.update_payment_profile(payment_profile, profile)
      expect(response.success?).to eq true
    end
    
    it "should be able to validate payment profiles" do
      payment_profile.cust_type = :business

      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:update_payment_profile)
      response = transaction.update_payment_profile(payment_profile, profile, :validation_mode => :testMode)
      expect(response.success?).to eq true
      expect(response.validation_response).not_to eq nil
      expect(response.validation_response).to be_instance_of(AuthorizeNet::AIM::Response)
      expect(response.validation_response.success?).to eq true
    end
    
    describe "should be able to create payment transactions" do
      
      before do
        @amount = (rand(10000) + 100) / 100.0
      end
      
      it "should support authorization and capture transactions" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        expect(transaction).to respond_to(:create_transaction_auth_capture)
        response = transaction.create_transaction_auth_capture(@amount, profile, payment_profile, AuthorizeNet::Order.new())
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
        expect(direct_response.success?).to eq true
      end
      
      it "should support authorization only transactions" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        expect(transaction).to respond_to(:create_transaction_auth_only)
        response = transaction.create_transaction_auth_only(@amount, profile, payment_profile, AuthorizeNet::Order.new())
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
        expect(direct_response.success?).to eq true
      end
      
      it "should support prior authorization capture transactions" do
        # create an auth only transaction
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_only(@amount + 10, profile, payment_profile, AuthorizeNet::Order.new())
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response.success?).to eq true
        
        # capture it
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        expect(transaction).to respond_to(:create_transaction_prior_auth_capture)
        response = transaction.create_transaction_prior_auth_capture(direct_response.transaction_id, @amount)
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
        expect(direct_response.success?).to eq true
      end
      
      it "should support voiding a transaction" do
        # create a transaction
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, profile, payment_profile, AuthorizeNet::Order.new())
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response.success?).to eq true
        
        # void it
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        expect(transaction).to respond_to(:create_transaction_void)
        response = transaction.create_transaction_void(direct_response.transaction_id)
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
        expect(direct_response.success?).to eq true
      end
      
      #it "should support refunding a transaction"
      #this test won't be created.  It requires overnight settlement in order to work.

      it "should support capture only transactions"

      
      it "should be able to support multiple payment profiles" do
        partial_auth_payment_profile.customer_payment_profile_id = create_payment_profile(partial_auth_payment_profile, profile)
        expect(partial_auth_payment_profile.customer_payment_profile_id).not_to eq nil
      end
      
      it "should support validating a payment profile" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        expect(transaction).to respond_to(:validate_payment_profile)
        response = transaction.validate_payment_profile(payment_profile, profile)
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
        expect(direct_response.success?).to eq true
      end
      
      it "should support custom delimiters" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, profile, payment_profile, AuthorizeNet::Order.new(), :aim_options => {:delim_char => '$'})
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response.success?).to eq true
      end
      
      it "should support custom fields" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, profile, payment_profile, AuthorizeNet::Order.new(), :custom_fields => {:foo => '123', :bar => '456'})
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response.success?).to eq true
        expect(direct_response.custom_fields[:foo]).to eq '123'
        expect(direct_response.custom_fields[:bar]).to eq '456'
      end

      it "should support passing order fields including invoice number" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        expect(transaction).to respond_to(:create_transaction_auth_capture)
        order = AuthorizeNet::Order.new()
        order.invoice_num = '11111'
        order.description =  'This order includes invoice num'
        order.po_num = 'PO_12345'
        response = transaction.create_transaction_auth_capture(@amount, profile, payment_profile, order)
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
        expect(direct_response.success?).to eq true
      end
      
      it "should support custom fields with custom delimeters" do
        transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
        response = transaction.create_transaction_auth_capture(@amount, profile, payment_profile, AuthorizeNet::Order.new(), :custom_fields => {:foo => '123', :bar => '456'}, :aim_options => {:delim_char => '$'})
        expect(response.success?).to eq true
        direct_response = response.direct_response
        expect(direct_response.success?).to eq true
        expect(direct_response.custom_fields[:foo]).to eq '123'
        expect(direct_response.custom_fields[:bar]).to eq '456'
      end
      
      describe "should be able to update split transaction statuses" do
        
        before do
          # create partial payment profile
          partial_auth_payment_profile.customer_payment_profile_id = create_payment_profile(partial_auth_payment_profile, profile)

          # create partial payment transaciton
          transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
          expect(transaction).to respond_to(:create_transaction_auth_capture)
          response = transaction.create_transaction_auth_capture(@amount, profile, partial_auth_payment_profile, AuthorizeNet::Order.new(), :aim_options => {:allow_partial_auth => true})
          expect(response.success?).to eq true
          direct_response = response.direct_response
          expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
          expect(direct_response.success?).to eq false
          expect(direct_response.response_code).to eq AuthorizeNet::AIM::Response::ResponseCode::HELD
          expect(direct_response.fields[:amount]).to eq 1.23
          expect(direct_response.fields[:split_tender_id]).not_to eq nil
          new_amount = @amount - direct_response.fields[:amount]
          @split_tender_id = direct_response.fields[:split_tender_id]

          # create transaction for the remaining value

          transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
          expect(transaction).to respond_to(:create_transaction_auth_capture)
          response = transaction.create_transaction_auth_capture(new_amount, profile, partial_auth_payment_profile, AuthorizeNet::Order.new(), :aim_options => {:split_tender_id => @split_tender_id})
          expect(response.success?).to eq true
          direct_response = response.direct_response
          expect(direct_response).to be_instance_of(AuthorizeNet::AIM::Response)
          expect(direct_response.success?).to eq true
        end
        
        it "should be able to complete a split transaction" do
          transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
          expect(transaction).to respond_to(:update_split_tender)
          response = transaction.update_split_tender(@split_tender_id, :completed)
          expect(response.success?).to eq true
        end
        
        it "should be able to void a split transaction" do
          transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
          expect(transaction).to respond_to(:update_split_tender)
          response = transaction.update_split_tender(@split_tender_id, :voided)
          expect(response.success?).to eq true
        end
      end
    end
  end
  
  describe "performing actions on addresses" do
    
    def create_address(address, profile)
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:create_address)
      response = transaction.create_address(address, profile)
      expect(response.success?).to eq true
      expect(response.address_id).not_to eq nil

      return response.address_id
    end
    
    before do
      profile.customer_profile_id = create_profile(profile)
      address.customer_address_id = create_address(address, profile)
    end
    
    after do
      delete_profile(profile)
    end
    
    it "should be able to create addresses" do
      # our before and after filters handle it all
    end
    
    it "should be able to delete addresses" do
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:delete_address)
      response = transaction.delete_address(address, profile)
      expect(response.success?).to eq true
    end

    it "should be able to retrieve addresses" do
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:get_address)
      response = transaction.get_address(address, profile)
      expect(response.success?).to eq true
      expect(response.address).to be_kind_of(AuthorizeNet::Address)
    end
    
    it "should be able to update addresses" do
      address.zip = '55555'
      transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
      expect(transaction).to respond_to(:update_address)
      response = transaction.update_address(address, profile)
      expect(response.success?).to eq true
    end
    
  end
  
  it "should be able to get all profile ids" do
    transaction = AuthorizeNet::CIM::Transaction.new(api_login, api_key, :gateway => :sandbox)
    expect(transaction).to respond_to(:get_profile_ids)
    response = transaction.get_profile_ids
    expect(response).to be_kind_of(AuthorizeNet::CIM::Response)
    expect(response.success?).to eq true
    expect(response.profile_ids).not_to eq nil
  end
  
  it "should be able to get zero profile ids when a merchant has zero customer profiles" do
    #Using specific credentials for a Merchant which has zero customer profiles
    #NOTE: These credentials are specific to this test
    transaction = AuthorizeNet::CIM::Transaction.new("982fNqW7sZ", "3k2549N82e53gKHa", :gateway => :sandbox)
    expect(transaction).to respond_to(:get_profile_ids)
    response = transaction.get_profile_ids
    expect(response).to be_kind_of(AuthorizeNet::CIM::Response)
    expect(response.success?).to eq true
    expect(response.profile_ids).to eq nil
  end
end

describe AuthorizeNet::CIM::Response do
  let(:api_key) { credentials['api_transaction_key'] }
  let(:api_login) { credentials['api_login_id'] }

  it "should support instantiation" do
    expect(AuthorizeNet::CIM::Response.new('', nil)).to be_instance_of(AuthorizeNet::CIM::Response)
  end
end
