module AuthorizeNet::SIM

  # The SIM transaction class. Handles building the transaction payload and
  # generating a set of hidden form fields to be POSTed to the gateway.
  class Transaction < AuthorizeNet::KeyValueTransaction
    
    RANDOM_SEQUENCE_MAX = (1 << 32) - 1
    
    # Our MD5 digest generator.
    @@digest  = OpenSSL::Digest.new('md5')

    # The default options for the constructor.
    @@option_defaults = {
      :sequence => nil,
      :timestamp => nil,
      :test => false,
      :hosted_payment_form => false,
      :relay_response => true,
      :relay_url => nil,
      :transaction_type => Type::AUTHORIZE_AND_CAPTURE
    }
    
    # Constructs a SIM transaction. You can use the new SIM transaction object
    # to build the hidden field payload needed to process a SIM transaction with
    # the gateway. In particular, this class handles generating the MD5 fingerprint
    # used to authenticate transactions at the gateway. Since the fingerprint includes
    # the amount to charge, you should not construct this object until you know EXACTLY
    # how much you want to charge (or authorize).
    # 
    # +api_login_id+:: Your API login ID, as a string.
    # +api_transaction_key+:: Your API transaction key, as a string.
    # +amount+:: The amount of the transaction, as a string, Float or BigDecimal.
    # +options+:: A hash of options. See below for values.
    # 
    # Options
    # +sequence+:: The sequence number of the transaction as a string or Fixnum. This is usually something like an invoice number. If none is provided, the SDK generates one at random.
    # +timestamp+:: The time the transaction was initiated as a string or Fixnum. This needs to be within 15 minutes of when the gateway receives the transaction. If no value is provided, the SDK defaults it to Time.now().
    # +test+:: A boolean indicating if the transaction should be run in test mode or not (defaults to false).
    # +hosted_payment_form+:: A boolean indicating if the transaction should use a hosted payment form (defaults to false).
    # +relay_response+:: A boolean indicating if the transaction should use the relay response feature to return a receipt to the customer (defaults to true). Direct Post Method requires using a relay response.
    # +relay_url+:: A string of the URL that the gateway should hit to get the relay response (defaults to nil).
    # +transaction_type+:: The type of transaction to perform. Defaults to AuthorizeNet::Type::AUTHORIZE_AND_CAPTURE. This value is only used if run is called directly.
    # 
    def initialize(api_login_id, api_transaction_key, amount, options = {})
      super()
      @api_transaction_key = api_transaction_key
      @api_login_id = api_login_id
      @amount = decimal_to_value(amount)
      options = @@option_defaults.merge(options)
      @sequence = options[:sequence]
      @timestamp = options[:timestamp]
      @test_mode = options[:test]
      @hosted_payment_form = options[:hosted_payment_form]
      @relay_url = options[:relay_url]
      @type = options[:transaction_type]
      unless @relay_url.nil?
        @relay_response = true
      else
        @relay_response = !!options[:relay_response]
      end
      @delim_data = !@relay_response
    end
    
    # Calculates and returns the HMAC-MD5 fingerprint needed to authenticate the transaction
    # with the SIM gateway.
    def fingerprint
      if @timestamp.nil?
        @timestamp = Time.now.to_i
      end
      
      if @sequence.nil?
        @sequence = rand(RANDOM_SEQUENCE_MAX)
      end
      OpenSSL::HMAC.hexdigest(@@digest, @api_transaction_key, "#{@api_login_id.to_s.rstrip}^#{@sequence.to_s.rstrip}^#{@timestamp.to_s.rstrip}^#{@amount.to_s.rstrip}^")
    end
    
    # Returns all the fields needed for the fingerprint. These must all be passed to the SIM
    # exactly as returned. And these values are time sensitive.
    def fingerprint_fields
      {
        :login => @api_login_id,
        :fp_hash => fingerprint,
        :fp_sequence => @sequence,
        :fp_timestamp => @timestamp,
        :amount => @amount
      }
    end
    
    # Returns all the fields (including custom) exactly as they should be named
    # in the SIM form. Fields with multiple values are returned with an array
    # for the key's value.
    def form_fields
      form_fields = {}
      form_fields[:x_test_request] = boolean_to_value(@test_mode)
      if @hosted_payment_form
        form_fields[:x_show_form] = 'PAYMENT_FORM'
      end
      if @relay_response && !@relay_url.nil?
        form_fields[:x_relay_url] = @relay_url
      end
      fields.merge(:type => @type, :version => @version, :delim_data => boolean_to_value(@delim_data), :relay_response => boolean_to_value(@relay_response)).each do |k, v|
        form_fields[to_external_field(k)] = v
      end
      fingerprint_fields.each do |k, v|
        form_fields[to_external_field(k)] = v
      end
      form_fields.merge(custom_fields)
    end
    
    
    # Takes an instance of AuthorizeNet::SIM::HostedPaymentForm and adds it to the transaction. Note that
    # many of the fields in AuthorizeNet::SIM::HostedPaymentForm are shared with those in
    # AuthorizeNet::SIM::HostedReceiptPage. For the duplicate fields, which ever value
    # is added to the transaction last will be the one used.
    def set_hosted_payment_form(form)
      @fields.merge!(form.to_hash)
      @hosted_payment_form = true
    end
    
    # Takes an instance of AuthorizeNet::SIM::HostedReceiptPage and adds it to the transaction. Note that
    # many of the fields in AuthorizeNet::SIM::HostedReceiptPage are shared with those in
    # AuthorizeNet::SIM::HostedPaymentForm. For the duplicate fields, which ever value
    # is added to the transaction last will be the one used. If you set a hosted payment receipt,
    # the relay response will be disabled.
    def set_hosted_payment_receipt(form)
      @fields.merge!(form.to_hash)
      @relay_response = false
      @delim_data = true
    end
    
    # An alias for form_fields.
    def run
      form_fields
    end
  
  end

end