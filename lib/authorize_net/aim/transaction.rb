module AuthorizeNet::AIM
  
  # The AIM transaction class. Handles building the transaction payload and
  # transmitting it to the gateway.
  class Transaction < AuthorizeNet::KeyValueTransaction
    
    # The default options for the constructor.
    @@option_defaults = {
      :transaction_type => Type::AUTHORIZE_AND_CAPTURE,
      :gateway => :production,
      :test => false,
      :allow_split => false,
      :delimiter => ',',
      :encapsulation_character => nil,
      :verify_ssl => false,
      :device_type => DeviceType::UNKNOWN,
      :market_type => MarketType::RETAIL
    }
    
    # Fields to convert to/from booleans.
    @@boolean_fields = [:tax_exempt, :test_request, :recurring_billing, :allow_partial_auth, :delim_data, :email_customer, :relay_response]
    
    # Fields to convert to/from BigDecimal.
    @@decimal_fields = [:amount]
    
    # Constructs an AIM transaction. You can use the new AIM transaction object
    # to issue a request to the payment gateway and parse the response into a new
    # AuthorizeNet::AIM::Response object.
    # 
    # +api_login_id+:: Your API login ID, as a string.
    # +api_transaction_key+:: Your API transaction key, as a string.
    # +options+:: A hash of options. See below for values.
    # 
    # Options
    # +transaction_type+:: The type of transaction to perform. Defaults to AuthorizeNet::Type::AUTHORIZE_AND_CAPTURE. This value is only used if run is called directly.
    # +gateway+:: The gateway to submit the transaction to. Can be a URL string, an AuthorizeNet::AIM::Transaction::Gateway constant, or one of the convenience symbols :sandbox, :test, :card_present_test, :card_present_live, :card_present_sandbox, :card_present_production, :production, or :live (:test is an alias for :sandbox, :card_present_test is an alias for :card_present_sandbox, :card_present_production is an alias for :card_present_live, and :live is an alias for :production). 
    # +test+:: A boolean indicating if the transaction should be run in test mode or not (defaults to false).
    # +allow_split+:: A boolean indicating if split transactions should be allowed (defaults to false).
    # +delimiter+:: A single character (as a string) that will be used to delimit the response from the gateway. Defaults to ','.
    # +encapsulation_character+:: A single character (as a string) that will be used to encapsulate each field in the response from the gateway. Defaults to nil.
    # +verify_ssl+:: A boolean indicating if the SSL certificate of the +gateway+ should be verified. Defaults to false.
    # +device_type+:: A constant from DeviceType indicating the type of POS device used in a card present transaction. Defaults to DeviceType::UNKNOWN.
    # +market_type+:: A constant from MarketType indicating your industry. Used for card present transactions. Defaults to MarketType::RETAIL.
    #
    def initialize(api_login_id, api_transaction_key, options = {})
      super()
      options = @@option_defaults.merge(options)
      @api_login_id = api_login_id
      @api_transaction_key = api_transaction_key
      @test_mode = options[:test]
      @response ||= nil
      @delimiter = options[:delimiter]
      @type = options[:transaction_type]
      @cp_version = nil
      case options[:gateway]
      when :sandbox, :test
        @gateway = Gateway::TEST
      when :production, :live
        @gateway = Gateway::LIVE
      when :card_present_live, :card_present_production
        @gateway = Gateway::CARD_PRESENT_LIVE
        @cp_version = '1.0'
      when :card_present_test, :card_present_sandbox
        @gateway = Gateway::CARD_PRESENT_TEST
        @cp_version = '1.0'
      else
        @gateway = options[:gateway]
      end
      @allow_split_transaction = options[:allow_split]
      @encapsulation_character = options[:encapsulation_character]
      @verify_ssl = options[:verify_ssl]
      @market_type = options[:market_type]
      @device_type = options[:device_type]
      @solution_id = options[:solution_id]
    end
    
    # Checks if the transaction has been configured for test mode or not. Return TRUE if the
    # transaction is a test transaction, FALSE otherwise. All transactions run against the sandbox
    # are considered test transactions.
    def test?
      super || @gateway == Gateway::TEST
    end
    
    # Returns TRUE if split transactions are allowed, FALSE otherwise.
    def split_transaction_allowed?
      !!@allow_split_transaction
    end
    
    # Returns the current encapsulation character unless there is none, in which case Nil is returned.
    def encapsulation_character
      @encapsulation_character
    end
    
    # Returns the gateway to be used for this transaction.
    def gateway
      @gateway
    end
    
    # Checks to see if the transaction has a response (meaning it has been submitted to the gateway).
    # Returns TRUE if a response is present, FALSE otherwise.
    def has_response?
      !@response.nil?
    end
    
    # Retrieve the response object (or Nil if transaction hasn't been sent to the gateway).
    def response
      @response
    end
    
    # Returns the current delimiter we are using to parse the fields returned by the
    # gateway.
    def delimiter
      @delimiter
    end
    
    # Sets the delimiter used to parse the response from the gateway.
    def delimiter=(delimiter)
      @delimiter = delimiter
    end
    
    # Submits the transaction to the gateway for processing. Returns a response object. If the transaction
    # has already been run, it will return nil.
    def run
      make_request
    end
    
    # Returns the current card present API version that we are adhering to.
    def cp_version
      @cp_version
    end

    def solution_id
      @solution_id
    end
    
    #:enddoc:
    protected
    
    # An internal method that builds the POST body, submits it to the gateway, and constructs a Response object with the response.
    def make_request
      if has_response?
        return nil
      end
      url = URI.parse(@gateway)
      fields = @fields.merge(:type => @type, :delim_char => @delimiter, :delim_data => "TRUE", :login => @api_login_id, :tran_key => @api_transaction_key, :relay_response => "FALSE")
      
      if @cp_version.nil?
        fields.merge!(:version => @version)
      else
        fields.merge!(:cp_version => @cp_version, :market_type => @market_type, :device_type => @device_type, :response_format => "1")
      end
      fields[:test_request] = boolean_to_value(@test_mode)
      fields[:allow_partial_auth] = 'TRUE' if @allow_split_transaction
      fields[:encap_char] = @encapsulation_character unless @encapsulation_character.nil?
      fields[:solution_id] = @solution_id unless @solution_id.nil?
      fields.each do |k, v|
        if @@boolean_fields.include?(k)
          fields[k] = boolean_to_value(v)
        elsif @@decimal_fields.include?(k)
          fields[k] = decimal_to_value(v)
        end
      end
      data = fields.collect do |key, val|
        self.to_param(key, val)
      end
      custom_field_keys = @custom_fields.keys.collect(&:to_s).sort.collect(&:to_sym)
      for key in custom_field_keys
        data += [self.to_param(key, @custom_fields[key.to_sym], '')]
      end
      data.flatten!
      request = Net::HTTP::Post.new(url.path)
      request.content_type = 'application/x-www-form-urlencoded'
      request.body = data.join("&")
      connection = Net::HTTP.new(url.host, url.port)
      connection.use_ssl = true
      if @verify_ssl
        connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
      else
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      begin
        @response = AuthorizeNet::AIM::Response.new((connection.start {|http| http.request(request)}), self)
      rescue
        @response = AuthorizeNet::AIM::Response.new($!, self)
      end
    end
    
  end
  
end