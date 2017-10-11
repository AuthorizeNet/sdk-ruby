module AuthorizeNet
  
  # The core, API agnostic transaction class. You shouldn't instantiate this one.
  # Instead you should use AuthorizeNet::AIM::Transaction,
  # AuthorizeNet::SIM::Transaction or AuthorizeNet::ARB::Transaction.
  class Transaction
    
    include AuthorizeNet::TypeConversions
    
    # Fields to convert to/from booleans.
    @@boolean_fields = []
    
    # Fields to convert to/from BigDecimal.
    @@decimal_fields = []
    
    # DO NOT USE. Instantiate AuthorizeNet::AIM::Transaction,
    # AuthorizeNet::SIM::Transaction or AuthorizeNet::ARB::Transaction instead.
    def initialize()
      @fields ||= {}
    end
    
    # Sets arbitrary API fields, overwriting existing values if they exist.
    # Takes a hash of key/value pairs, where the keys are the field names
    # without the "x_" prefix. You can set a field to Nil to unset it. If the
    # value is an array, each value in the array will be added. For example,
    # set_fields({:line_item => ["item1<|>golf balls<|><|>2<|>18.95<|>Y",
    # "item2<|>golf bag<|>Wilson golf carry bag, red<|>1<|>39.99<|>"]})
    # would generate two x_line_item fields in the transaction, one for
    # each value in the array.
    def set_fields(fields = {})
      @fields.merge!(fields)
      @fields.reject! {|k, v| v.nil?}
      @fields
    end
    
    # Returns the current hash of API fields.
    def fields
      @fields
    end
        
    # Takes an instance of AuthorizeNet::Address and adds it to the transaction.
    def set_address(address)
      @fields.merge!(address.to_hash)
    end
    
    # Takes an instance of AuthorizeNet::ShippingAddress and adds it to the
    # transaction.
    def set_shipping_address(address)
      @fields.merge!(address.to_hash)
    end
    
    # Takes an instance of AuthorizeNet::Customer and adds it to the transaction.
    def set_customer(customer)
      @fields.merge!(customer.to_hash)
    end
    
    #:enddoc:
    protected
    
    # Internal method to handle multiple types of payment arguments.
    def handle_payment_argument(payment)
      case payment
      when AuthorizeNet::CreditCard, AuthorizeNet::ECheck
        set_fields(payment.to_hash)
      else
        set_fields(:card_num => payment)
      end
    end
    
  end
  
end