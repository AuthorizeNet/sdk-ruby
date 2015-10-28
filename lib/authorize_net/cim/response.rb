module AuthorizeNet::CIM

  # The CIM response class.
  class Response < AuthorizeNet::XmlResponse
    
    include AuthorizeNet::CIM::Fields
    
    # Constructs a new response object from raw_response in the context of transaction.
    # You don‘t typically construct this object yourself, as AuthorizeNet::CIM::Transaction
    # will build one for you when it makes the request to the gateway.
    def initialize(raw_response, transaction)
      super
      unless connection_failure?
        begin
          @customer_profile_id = node_content_unless_nil(@root.at_css('customerProfileId'))
          @customer_payment_profile_id = node_content_unless_nil(@root.at_css('customerPaymentProfileId'))
          @customer_payment_profile_id_list = node_child_content_unless_nil(@root.at_css('customerPaymentProfileIdList'))
          @customer_shipping_address_id_list = node_child_content_unless_nil(@root.at_css('customerShippingAddressIdList'))
          @customer_address_id = node_content_unless_nil(@root.at_css('customerAddressId'))
          @validation_direct_response_list = @root.at_css('validationDirectResponseList')
          @validation_direct_response = @root.at_css('validationDirectResponse')
          @direct_response = @root.at_css('directResponse')
          @customer_profile_id_list = node_child_content_unless_nil(@root.at_css('ids'))
          @address = @root.at_css('address')
          @payment_profile = @root.at_css('paymentProfile')
          @profile = @root.at_css('profile')
          @token = node_content_unless_nil(@root.at_css('token'))
        rescue
          @raw_response = $!
        end
      end
    end
    
    # Returns a CustomerProfile ID if one was returned by the gateway. Returns nil otherwise.
    # Note that this method will return nil if we got back a list of IDs (see profile_ids).
    def profile_id
      @customer_profile_id
    end
    
    # Returns a list of CustomerProfile IDs if any were returned by the gateway. Returns nil otherwise.
    def profile_ids
      @customer_profile_id_list
    end
    
    # Returns an Address ID if one was returned by the gateway. Returns nil otherwise.
    # Note that this method will return nil if we got back a list of IDs (see address_ids).
    def address_id
      @customer_address_id
    end
    
    # Returns a list of Address IDs if any were returned by the gateway. Returns nil otherwise.
    def address_ids
      @customer_shipping_address_id_list
    end
    
    # Returns a PaymentProfile ID if one was returned by the gateway. Returns nil otherwise.
    # Note that this method will return nil if we got back a list of IDs (see payment_profile_ids).
    def payment_profile_id
      @customer_payment_profile_id
    end
    
    # Returns a list of PaymentProfile IDs if any were returned by the gateway. Returns nil otherwise.
    def payment_profile_ids
      @customer_payment_profile_id_list
    end

    # Returns hosted profile access token when requested. Returns nil otherwise.
    def token
      @token
    end
    
    # Returns a validation response as an AuthorizeNet::AIM::Response object if a validation response was returned
    # by the gateway. Returns nil otherwise.
    # Note that this method will return nil if we got back a list of IDs (see validation_responses).
    def validation_response
      AuthorizeNet::AIM::Response.new(@validation_direct_response.dup, @transaction) unless @validation_direct_response.nil?
    end
    
    # Returns a list of validation response as an AuthorizeNet::AIM::Response objects if a list of validation response was returned
    # by the gateway. Returns nil otherwise.
    def validation_responses
      unless @validation_direct_response_list.nil?
        responses = []
        @validation_direct_response_list.element_children.each do |child|
          responses <<= AuthorizeNet::AIM::Response.new(child.dup, @transaction) unless child.nil?
        end
        return responses unless responses.length == 0
      end
    end
    
    # Returns the direct response as an AuthorizeNet::AIM::Response object if a direct response was returned
    # by the gateway. Returns nil otherwise.
    def direct_response
      AuthorizeNet::AIM::Response.new(@direct_response.dup, @transaction) unless @direct_response.nil?
    end
    
    # Returns a CustomerProfile built from the entity returned by the gateway. Returns nil otherwise.
    def profile
      build_entity(@profile, Fields::PROFILE_ENTITY_DESCRIPTION) unless @profile.nil?
    end
    
    # Returns a PaymentProfile built from the entity returned by the gateway. Returns nil otherwise.
    def payment_profile
      build_entity(@payment_profile, Fields::PAYMENT_PROFILE_ENTITY_DESCRIPTION) unless @payment_profile.nil?
    end
    
    # Returns an Address built from the entity returned by the gateway. Returns nil otherwise.
    def address
      build_entity(@address, Fields::ADDRESS_ENTITY_DESCRIPTION) unless @address.nil?
    end
    
    #:enddoc:
    protected
    
  end
end