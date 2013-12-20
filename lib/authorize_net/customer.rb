module AuthorizeNet
  
  # Models a customer.
  class Customer
    attr_accessor
    include AuthorizeNet::Model
    
    attr_accessor :phone, :fax, :email, :id, :ip, :address, :description
    
    def to_hash
      hash = {
        :phone => @phone,
        :fax => @fax,
        :email => @email,
        :cust_id => @id,
        :customer_ip => @ip,
        :description => @description,
        :customer_profile_id => @customer_profile_id
      }
      hash.delete_if {|k, v| v.nil?}
      hash.merge!(@address.to_hash) unless @address.nil?
      hash
    end
    
  end
  
end