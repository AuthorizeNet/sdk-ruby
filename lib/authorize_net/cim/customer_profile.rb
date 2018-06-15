module AuthorizeNet::CIM
  # Models a customer profile.
  class CustomerProfile < AuthorizeNet::Customer
    include AuthorizeNet::Model

    attr_accessor :customer_profile_id, :payment_profiles

    def to_hash
      hash = super
      hash.delete_if { |_k, v| v.nil? }
      hash[:payment_profiles] = handle_multivalue_hashing(@payment_profiles)
      hash
    end
  end
end
