module AuthorizeNet
  
  # The core, key/value transaction class. You shouldn't instantiate this one.
  # Instead you should use AuthorizeNet::AIM::Transaction or AuthorizeNet::SIM::Transaction.
  class KeyValueTransaction < AuthorizeNet::Transaction
    
    # Constants for both the various Authorize.Net payment gateways are defined here.
    module Gateway
      LIVE = 'https://secure.authorize.net/gateway/transact.dll'
      TEST = 'https://test.authorize.net/gateway/transact.dll'
      CARD_PRESENT_LIVE = 'https://cardpresent.authorize.net/gateway/transact.dll'
      CARD_PRESENT_TEST = 'https://test.authorize.net/gateway/transact.dll'
    end
    
    # Constants for both the various Authorize.Net payment transaction types are defined here.
    module Type
      AUTHORIZE_AND_CAPTURE = "AUTH_CAPTURE"
      AUTHORIZE_ONLY = "AUTH_ONLY"
      CAPTURE_ONLY = "CAPTURE_ONLY"
      CREDIT = "CREDIT"
      PRIOR_AUTHORIZATION_AND_CAPTURE = "PRIOR_AUTH_CAPTURE"
      VOID = "VOID"
    end
    
    # Constants for the various device types used in card present transactions.
    module DeviceType
      UNKNOWN = 1
      UNATTENDED = 2
      SELF_SERVICE = 3
      CASH_REGISTER = 4
      PC_TERMINAL = 5
      AIRPAY = 6
      WIRELESS_POS = 7
      WEBSITE_TERMINAL = 8
      DIAL_TERMINAL = 9
      VIRTUAL_TERMINAL = 10
    end
    
    # Constants for the various market types used in card present transactions.
    module MarketType
      RETAIL = 2
    end
    
    # The default options for purchase.
    @@purchase_option_defaults = {
      :cardholder_auth_value => nil,
      :cardholder_auth_indicator => nil
    }
    
    # The default options for authorize.
    @@authorize_option_defaults = {
      :cardholder_auth_value => nil,
      :cardholder_auth_indicator => nil
    }
    
    # Fields to convert to/from booleans.
    @@boolean_fields = []
    
    # Fields to convert to/from BigDecimal.
    @@decimal_fields = []
    
    # DO NOT USE. Instantiate AuthorizeNet::AIM::Transaction or AuthorizeNet::SIM::Transaction instead.
    def initialize()
      super
      @custom_fields ||= {}
      @test_mode ||= false
      @version = '3.1'
    end
    
    # Checks if the transaction has been configured for test mode or not. Return TRUE if the
    # transaction is a test transaction, FALSE otherwise. All transactions run against the sandbox
    # are considered test transactions.
    def test?
      !!@test_mode
    end
    
    # Returns the current API version that we are adhering to
    def version
      @version
    end
        
    # Sets arbitrary custom fields, overwriting existing values if they exist. Takes a hash of key/value pairs, 
    # where the keys are the field names. You can set a field to Nil to unset it.
    def set_custom_fields(fields = {})
      @custom_fields.merge!(fields)
    end
    
    # Returns the current hash of custom fields.
    def custom_fields
      @custom_fields
    end
    
    # Convenience method for adding line items to a transaction.
    def add_line_item(id = nil, name = nil, description = nil, quantity = nil, price = nil, taxable = nil)
      line_item = "#{id}<|>#{name}<|>#{description}<|>#{quantity}<|>#{price}<|>#{taxable}"
      if @fields.has_key?(:line_item)
        @fields[:line_item] = @fields[:line_item].to_a << line_item
      else
        @fields[:line_item] = [line_item]
      end
    end
    
    # Takes an instance of AuthorizeNet::EmailReceipt and adds it to the transaction.
    def set_email_receipt(email)
      @fields.merge!(email.to_hash)
    end
    
    # Returns the type of transaction.
    def type
      @type
    end
    
    # Sets the type of transaction.
    def type=(type)
      case type
      when :authorize, :auth_only
        @type = Type::AUTHORIZE_ONLY
      when :purchase, :auth_and_capture
        @type = Type::AUTHORIZE_AND_CAPTURE
      when :refund, :credit
        @type = Type::CREDIT
      when :void
        @type = Type::VOID
      when :capture, :capture_only
        @type = Type::CAPTURE_ONLY
      when :prior_auth_capture
        @type = Type::PRIOR_AUTHORIZATION_AND_CAPTURE
      else
        @type = type
      end
    end
    
    # Sets up and submits a standard purchase (AUTHORIZE_AND_CAPTURE) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil.
    # 
    # +amount+:: The amount to charge. Accepts a string in the format "%0.2f", a Float or a BigDecimal.
    # +credit_card+:: The credit card or eCheck to charge. Accepts an instance of AuthorizeNet::CreditCard, AuthorizeNet::ECheck, or a string of digits (in which case the expiration should be added using set_fields).
    # +options+:: A hash with any of following keys: cardholder_auth_indicator, cardholder_auth_value. These are for CAVV and can be ignored in most cases.
    # 
    # 
    # Typical usage:
    # 
    #   credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
    #   response = transaction.purchase(10.0, credit_card)
    # 
    def purchase(amount, credit_card, options = {})
      handle_payment_argument(credit_card)
      options = @@purchase_option_defaults.merge(options)
      handle_cavv_options(options)
      set_fields(:amount => amount)
      self.type = Type::AUTHORIZE_AND_CAPTURE
      run
    end
    
    # Sets up and submits a refund (CREDIT) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil.
    # 
    # +amount+:: The amount to refund. Accepts a string in the format "%0.2f", a Float or a BigDecimal.
    # +transaction+:: The transaction ID to apply the refund to. Accepts a string of the transaction ID, an instance of AuthorizeNet::Transaction or AuthorizeNet::Response.
    # +credit_card+:: The credit card or eCheck to charge. Accepts an instance of AuthorizeNet::CreditCard, AuthorizeNet::ECheck, or a string of digits. In many cases you only need the last 4 digits of the credit card here.
    # 
    # 
    # Typical usage:
    # 
    #   response = transaction.refund(10.0, '123456789', '1212')
    #
    def refund(amount, transaction, credit_card)
      handle_payment_argument(credit_card)
      handle_transaction_argument(transaction)
      set_fields(:amount => amount)
      self.type = Type::CREDIT
      run
    end
    
    # Sets up and submits a refund (CREDIT) transaction for a transaction that was not originally
    # submitted via the payment gateway. Note that this is a special feature which requires your
    # account to support ECC (expanded credits capability) transactions.
    # 
    # +amount+:: The amount to refund. Accepts a string in the format "%0.2f", a Float or a BigDecimal.
    # +credit_card+:: The credit card or eCheck to charge. Accepts an instance of AuthorizeNet::CreditCard, AuthorizeNet::ECheck, or a string of digits.
    # 
    # Typical usage:
    # 
    #   response = transaction.unlinked_credit(10.0, '4111111111111111')
    # 
    def unlinked_credit(amount, credit_card)
      handle_payment_argument(credit_card)
      set_fields(:amount => amount)
      self.type = Type::CREDIT
      run
    end
    
    # Sets up and submits a void (VOID) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil. Note that you can only void unsettled transactions.
    # 
    # +transaction+:: The transaction ID of the transaction to void. Accepts a string of the transaction ID, an instance of AuthorizeNet::Transaction or AuthorizeNet::Response.
    # 
    # 
    # Typical usage:
    # 
    #   response = transaction.void('123456789')
    #
    def void(transaction)
      handle_transaction_argument(transaction)
      self.type = Type::VOID
      run
    end
    
    # Sets up and submits an authorize (AUTH_ONLY) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil. Use this to put a hold on funds, but don't actually charge
    # the card yet.
    # 
    # +amount+:: The amount to authorize. Accepts a string in the format "%0.2f", a Float or a BigDecimal.
    # +credit_card+:: The credit card or eCheck to charge. Accepts an instance of AuthorizeNet::CreditCard, AuthorizeNet::ECheck, or a string of digits (in which case the expiration should be added using set_fields).
    # +options+:: A hash with any of following keys: cardholder_auth_indicator, cardholder_auth_value. These are for CAVV and can be ignored in most cases.
    # 
    # 
    # Typical usage:
    # 
    #   credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
    #   response = transaction.authorize(10.0, credit_card)
    #
    def authorize(amount, credit_card, options = {})
      handle_payment_argument(credit_card)
      options = @@authorize_option_defaults.merge(options)
      handle_cavv_options(options)
      set_fields(:amount => amount)
      self.type = Type::AUTHORIZE_ONLY
      run
    end
    
    # Sets up and submits a capture (CAPTURE_ONLY) transaction. Returns a response object. If the transaction
    # has already been run, it will return nil. Note that you can not capture a transaction that was made
    # though the AIM API using this method. Use prior_auth_capture instead.
    # 
    # +amount+:: The amount to capture. Accepts a string in the format "%0.2f", a Float or a BigDecimal.
    # +authorization_code+:: The authorization code of the transaction to capture. Accepts a string.
    # 
    # 
    # Typical usage:
    # 
    #   response = transaction.capture(10.0, '123FAKE')
    #
    def capture(amount, authorization_code)
      set_fields(:amount => amount, :auth_code => authorization_code)
      self.type = Type::CAPTURE_ONLY
      run
    end
    
    # Sets up and submits a capture (PRIOR_AUTH_CAPTURE) transaction. Returns a response object. Use this method
    # to actually charge a card that you previously put a hold on (using authorize).
    # 
    # +transaction+:: The transaction ID to capture. Accepts a string of the transaction ID, an instance of AuthorizeNet::Transaction or AuthorizeNet::Response.
    # +amount+:: The amount to capture (only if less than the amount originally authorized, otherwise leave as Nil). Accepts a string in the format "%0.2f", a Float, a BigDecimal or Nil.
    # 
    # 
    # Typical usage:
    # 
    #   response = transaction.prior_auth_capture('123456789')
    #
    def prior_auth_capture(transaction, amount = nil)
      handle_transaction_argument(transaction)
      set_fields(:amount => amount)
      self.type = Type::PRIOR_AUTHORIZATION_AND_CAPTURE
      run
    end
    
    #:enddoc:
    protected
    
    # Internal method to handle multiple types of transaction arguments.
    def handle_transaction_argument(transaction)
      case transaction
      when Transaction
        set_fields(:trans_id => transaction.response.transaction_id)
      when Response
        set_fields(:trans_id => transaction.transaction_id)
      else
        set_fields(:trans_id => transaction)
      end
    end
    
    # Internal method to handle CAVV options.
    def handle_cavv_options(options)
      set_fields(:authentication_indicator => options[:cardholder_auth_indicator]) unless options[:cardholder_auth_indicator].nil?
      set_fields(:cardholder_authentication_value => options[:cardholder_auth_value]) unless options[:cardholder_auth_value].nil?
    end
    
  end
  
end