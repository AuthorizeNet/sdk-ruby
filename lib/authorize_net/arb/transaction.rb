module AuthorizeNet::ARB

  # The ARB transaction class.
  class Transaction < AuthorizeNet::XmlTransaction
    
    include AuthorizeNet::ARB::Fields
    
    # The default options for the constructor.
    @@option_defaults = {
      :gateway => :production,
      :verify_ssl => false,
      :reference_id => nil
    }
    
    # Fields to convert to/from booleans.
    @@boolean_fields = []
    
    # Fields to convert to/from BigDecimal.
    @@decimal_fields = [:amount, :trial_amount]
    
    # Fields to convert to/from Date.
    @@date_fields = [:subscription_start_date]
    
    # The class to wrap our response in.
    @response_class = AuthorizeNet::ARB::Response   
    
    # Constructs an ARB transaction. You can use the new ARB transaction object
    # to issue a request to the payment gateway and parse the response into a new
    # AuthorizeNet::ARB::Response object.
    # 
    # +api_login_id+:: Your API login ID, as a string.
    # +api_transaction_key+:: Your API transaction key, as a string.
    # +options+:: A hash of options. See below for values.
    # 
    # Options
    # +gateway+:: The gateway to submit the transaction to. Can be a URL string, an AuthorizeNet::ARB::Transaction::Gateway constant, or one of the convenience symbols :sandbox, :test, :production, or :live (:test is an alias for :sandbox, and :live is an alias for :production). 
    # +verify_ssl+:: A boolean indicating if the SSL certificate of the +gateway+ should be verified. Defaults to false.
    # +reference_id+:: A string that can be used to identify a particular transaction with its response. Will be echo'd in the response, only if it was provided in the transaction. Defaults to nil.
    #
    def initialize(api_login_id, api_transaction_key, options = {})
      super
    end
    
    # Sets up and submits a start of subscription (ARBCreateSubscriptionRequest) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil.
    # 
    # +subscription+:: An instance of AuthorizeNet::ARB::Subscription describing the recurring payment you would like to create.
    # 
    # 
    # Typical usage:
    # 
    #   subscription = AuthorizeNet::ARB::Subscription.new(
    #     :name => "Monthly Gift Basket",
    #     :length => 1,
    #     :unit => :month,
    #     :start_date => Date.today,
    #     :total_occurrences => :unlimited,
    #     :amount => 100.00,
    #     :invoice_number => '1234567',
    #     :description => "John Doe's Monthly Gift Basket",
    #     :credit_card => AuthorizeNet::CreditCard.new('4111111111111111', '1120'),
    #     :billing_address => AuthorizeNet::Address.new(:first_name => 'John', :last_name => 'Doe')
    #   )
    #   response = transaction.create(subscription)
    #
    def create(subscription)
      @type = Type::ARB_CREATE
      set_fields(subscription.to_hash)
      run
    end
    
    # Sets up and submits a subscription update (ARBUpdateSubscriptionRequest) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil.
    # 
    # +subscription+:: An instance of AuthorizeNet::ARB::Subscription describing the changes to make. It must have a value for subscription_id so that the API knows what subscription to update. Note that some information (intervals, start dates, etc) can't be changed. See the ARB guide for more details.
    # 
    # 
    # Typical usage:
    # 
    #   subscription = AuthorizeNet::ARB::Subscription.new(
    #     :billing_address => AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe'),
    #     :subscription_id => '123456'
    #   )
    #   response = transaction.update(subscription)
    #
    def update(subscription)
      @type = Type::ARB_UPDATE
      set_fields(subscription.to_hash)
      run
    end
    
    # Sets up and submits a subscription status query (ARBGetSubscriptionStatusRequest) transaction. Returns a response object (which contains the subscription status). If the transaction
    # has already been run, it will return nil.
    # 
    # +subscription_id+:: Either the subscription id of the subscription to get the status of as a string, or a Subscription instance with a value for subscription_id set on it.
    # 
    # 
    # Typical usage:
    # 
    #   response = transaction.get_status('123456')
    #   response.subscription_status    # A value from AuthorizeNet::ARB::Subscription::Status
    #
    def get_status(subscription_id)
      @type = Type::ARB_GET_STATUS
      handle_subscription_id(subscription_id)
      run
    end

    # Sets up and submits a subscription list query (ARBGetSubscriptionListRequest). Returns a response object 
    # which contains the list of subscription details and the total number of subscriptions matching the search 
    # criteria. Sorting and Paging are optional parameters.
    #
    # Valid values for search type parameter:
    #    cardExpiringThisMonth
    #    subscriptionActive
    #    subscriptionExpiringThisMonth
    #    subscriptionInactive
    #
    # Typical usage:
    # 
    #   sorting = AuthorizeNet::ARB::Sorting.new('name',true)
    #   paging = AuthorizeNet::ARB::Paging.new(1,1000)
    #   response = transaction.get_subscription_list('subscriptionActive',sorting,paging)
    #
    def get_subscription_list(search_type, sorting = nil, paging = nil)
      unless search_type.nil?
        self.class.instance_variable_set(:@response_class,SubscriptionListResponse)
        @type = Type::ARB_GET_SUBSCRIPTION_LIST
        set_fields(:search_type => search_type.to_s) 
        unless sorting.nil?  
          set_fields(sorting.to_hash) 
        end
        unless paging.nil?
          set_fields(paging.to_hash) 
        end
      run
      end
      return response
    end
      
    # Sets up and submits a subscription cancelation (ARBCancelSubscriptionRequest) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil.
    # 
    # +subscription_id+:: Either the subscription id of the subscription to get the status of as a string, or a Subscription instance with a value for subscription_id set on it.
    # 
    # 
    # Typical usage:
    # 
    #   response = transaction.cancel('123456')
    #
    def cancel(subscription_id)
      @type = Type::ARB_CANCEL
      handle_subscription_id(subscription_id)
      run
    end
        
    #:enddoc:
    protected
    
    # Internal method to handle multiple types of subscription id arguments.
    def handle_subscription_id(subscription_id)
      case subscription_id
      when Subscription
        set_fields(:subscription_id => subscription_id.subscription_id.to_s)
      else
        set_fields(:subscription_id => subscription_id.to_s)
      end
    end
    
    # An internal method that builds the POST body, submits it to the gateway, and constructs a Response object with the response.
    def make_request
      set_fields(:reference_id => @reference_id)
      super
    end
    
  end
end
