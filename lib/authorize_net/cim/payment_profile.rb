module AuthorizeNet::CIM
  # Models a payment profile.
  class PaymentProfile
    module CustomerType
      INDIVIDUAL = 'individual'.freeze
      BUSINESS = 'business'.freeze
    end

    include AuthorizeNet::Model

    attr_accessor :cust_type, :billing_address, :payment_method, :customer_payment_profile_id

    def cust_type=(type) #:nodoc:
      case type
      when :business
        @cust_type = CustomerType::BUSINESS
      when :individual
        @cust_type = CustomerType::INDIVIDUAL
      else
        @cust_type = type
      end
    end

    def to_hash
      hash = {
        cust_type: @cust_type,
        customer_payment_profile_id: @customer_payment_profile_id
      }
      hash.delete_if { |_k, v| v.nil? }
      hash.merge!(@billing_address.to_hash) unless @billing_address.nil?
      hash.merge!(@payment_method.to_hash) unless @payment_method.nil?
      hash
    end
  end
end
