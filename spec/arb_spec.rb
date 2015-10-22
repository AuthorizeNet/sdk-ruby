require "spec_helper"

describe AuthorizeNet::ARB::Transaction do
  
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
    @subscription = AuthorizeNet::ARB::Subscription.new(
      :name => "monthly foo",
      :length => 1,
      :unit => AuthorizeNet::ARB::Subscription::IntervalUnits::MONTH,
      :start_date => Date.today,
      :total_occurrences => 1,
      :trial_occurrences => nil,
      :amount => 10.00,
      :trial_amount => nil, 
      :invoice_number => rand(),
      :description => "a test subscription",
      :subscription_id => nil,
      :customer => AuthorizeNet::Customer.new(:email => rand(10000000).to_s+'pb@mail.com', :id => rand(10000000).to_s),
      :credit_card => AuthorizeNet::CreditCard.new('4111111111111111', '01' + (Time.now + (3600 * 24 * 365)).strftime('%y')),
      :billing_address => AuthorizeNet::Address.new(:first_name => 'John', :last_name => 'Doe')
    )
  end
  
  it "should support instantiation" do
    AuthorizeNet::ARB::Transaction.new(@api_login, @api_key).should be_instance_of(AuthorizeNet::ARB::Transaction)
  end
  
  it "should not have a response if the transaction hasn't been run" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => @gateway)
    transaction.has_response?.should be_falsey
  end
  
  it "should support the returning its response object" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => @gateway)
    transaction.should respond_to(:response)
  end
  
  it "should know if its running against the sandbox or not" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.test?.should be_truthy
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => 'sandbox')
    transaction.test?.should be_truthy
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :live)
    transaction.test?.should be_falsey
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => 'live')
    transaction.test?.should be_falsey
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => 'moose')
    transaction.test?.should be_truthy
  end
  
  it "should have a response after running a transaction" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = transaction.create({})
    response.should be_instance_of(AuthorizeNet::ARB::Response)
  end
  
  it "should support creating a subscription" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = transaction.create(@subscription)
    response.success?.should be_truthy
  end
  
  it "should support canceling a subscription" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = transaction.create(@subscription)
    response.success?.should be_truthy
    cancel = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = cancel.cancel(response.subscription_id)
    response.success?.should be_truthy
  end
  
  it "should support getting the status of a subscription" do
    create = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = create.create(@subscription)
    response.success?.should be_truthy
    status = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = status.get_status(response.subscription_id)
    response.success?.should be_truthy
    response.subscription_status.should == AuthorizeNet::ARB::Subscription::Status::ACTIVE
  end
  
  it "should support updating a subscription" do
    create = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    response = create.create(@subscription)
    response.success?.should be_truthy
    update = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    subscription = AuthorizeNet::ARB::Subscription.new(:subscription_id => response.subscription_id, :billing_address => AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe'))
    response = update.update(subscription)
    response.success?.should be_truthy
  end

  it "should be able to retrieve list of subscriptions" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    sorting = AuthorizeNet::ARB::Sorting.new('name',true)
    paging = AuthorizeNet::ARB::Paging.new(1,1000)
    response = transaction.get_subscription_list('subscriptionActive',sorting,paging)
    response.success?.should be_truthy
    
    unless response.subscription_details.nil?
      response.subscription_details.length.should > 0
    else
      warn "no subscriptons found - please create some."
    end
  end

  it "should return successful response for valid subscription list search types and sortBy fields" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    paging = AuthorizeNet::ARB::Paging.new(1,1000)

    # iterate over valid search types
    [:cardExpiringThisMonth,:subscriptionActive,:subscriptionExpiringThisMonth, 
                                                         :subscriptionInactive].each{ |searchType|
      # iterate over valid sortBy fields
      [:id,:name,:status,:createTimeStampUTC,:lastName,:firstName,:accountNumber,:amount,
                                                                     :pastOccurrences].each{ |sortBy|
        sorting = AuthorizeNet::ARB::Sorting.new(sortBy,false)
        response = transaction.get_subscription_list(searchType,sorting,paging)
        response.success?.should be_truthy
      }
    }
  end

  it "should return error when invalid search type specified" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    paging = AuthorizeNet::ARB::Paging.new(1,1000)
    sorting = AuthorizeNet::ARB::Sorting.new(:name,true)
    
    response = transaction.get_subscription_list(:bogusSearchType,sorting,paging)
    response.success?.should be_falsey
  end

  it "should return error when invalid sortBy field specified" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    paging = AuthorizeNet::ARB::Paging.new(1,1000)
    sorting = AuthorizeNet::ARB::Sorting.new(:bogusSortField,true)
    
    response = transaction.get_subscription_list(:subscriptionActive,sorting,paging)
    response.success?.should be_falsey
  end

  it "should return error when invalid order descending parameter is specified" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    paging = AuthorizeNet::ARB::Paging.new(1,1000)
    sorting = AuthorizeNet::ARB::Sorting.new(:name,2)
    
    response = transaction.get_subscription_list(:subscriptionActive,sorting,paging)
    response.success?.should be_falsey
  end

  it "should return error when invalid paging offset is specified" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    paging = AuthorizeNet::ARB::Paging.new(0,1000)
    sorting = AuthorizeNet::ARB::Sorting.new(:name,false)
    
    response = transaction.get_subscription_list(:subscriptionActive,sorting,paging)
    response.success?.should be_falsey
  end

  it "should return error when invalid paging limit is specified" do
    transaction = AuthorizeNet::ARB::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    paging = AuthorizeNet::ARB::Paging.new(1,-1)
    sorting = AuthorizeNet::ARB::Sorting.new(:name,false)
    
    response = transaction.get_subscription_list(:subscriptionActive,sorting,paging)
    response.success?.should be_falsey
  end
end

describe AuthorizeNet::ARB::Response do
  
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
    AuthorizeNet::ARB::Response.new('', nil).should be_instance_of(AuthorizeNet::ARB::Response)
  end
end

describe AuthorizeNet::ARB::Subscription do
  
  before do
    @attributes = [:name, :length, :unit, :start_date, :total_occurrences, :trial_occurrences, :amount, :trial_amount, :invoice_number, :description, :subscription_id]
    @attribute_values = {
      :name => "daily foo",
      :length => 1,
      :unit => AuthorizeNet::ARB::Subscription::IntervalUnits::DAY,
      :start_date => Date.today,
      :total_occurrences => 1,
      :trial_occurrences => nil,
      :amount => 10.00,
      :trial_amount => nil, 
      :invoice_number => '123456',
      :description => "a test subscription",
      :subscription_id => nil,
      :credit_card => AuthorizeNet::CreditCard.new('4111111111111111', '01' + (Time.now + (3600 * 24 * 365)).strftime('%y')),
      :billing_address => AuthorizeNet::Address.new(:first_name => 'John', :last_name => 'Doe')
    }
  end
  
  it "should support instantiation" do
    AuthorizeNet::ARB::Subscription.new().should be_instance_of(AuthorizeNet::ARB::Subscription)
  end
  
  it "should support access to its attributes" do
    subscription = AuthorizeNet::ARB::Subscription.new(@attribute_values)
    @attribute_values.each do |k, v|
      subscription.send(k).should == v
    end
  end
  
  it "should support connivence values for unlimited subscription total occurrences" do
    subscription = AuthorizeNet::ARB::Subscription.new(:total_occurrences => :unlimited)
    subscription.total_occurrences.should == AuthorizeNet::ARB::Subscription::UNLIMITED_OCCURRENCES
    subscription = AuthorizeNet::ARB::Subscription.new()
    subscription.total_occurrences = :unlimited
    subscription.total_occurrences.should == AuthorizeNet::ARB::Subscription::UNLIMITED_OCCURRENCES
  end
  
  it "should support connivence values for day interval units" do
    subscription = AuthorizeNet::ARB::Subscription.new(:unit => :day)
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::DAY
    subscription = AuthorizeNet::ARB::Subscription.new(:unit => :days)
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::DAY
    subscription = AuthorizeNet::ARB::Subscription.new()
    subscription.unit = :day
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::DAY
    subscription = AuthorizeNet::ARB::Subscription.new()
    subscription.unit = :days
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::DAY
  end
  
  it "should support connivence values for month interval units" do
    subscription = AuthorizeNet::ARB::Subscription.new(:unit => :month)
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::MONTH
    subscription = AuthorizeNet::ARB::Subscription.new(:unit => :months)
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::MONTH
    subscription = AuthorizeNet::ARB::Subscription.new()
    subscription.unit = :month
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::MONTH
    subscription = AuthorizeNet::ARB::Subscription.new()
    subscription.unit = :months
    subscription.unit.should == AuthorizeNet::ARB::Subscription::IntervalUnits::MONTH
  end

end

