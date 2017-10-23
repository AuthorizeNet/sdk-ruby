module AuthorizeNet
  # Models a shipping address.
  class ShippingAddress < Address
    include AuthorizeNet::Model

    def to_hash
      hash = {
        ship_to_first_name: @first_name,
        ship_to_last_name: @last_name,
        ship_to_company: @company,
        ship_to_address: @street_address,
        ship_to_city: @city,
        ship_to_state: @state,
        ship_to_zip: @zip,
        ship_to_country: @country,
        ship_to_phone: @phone,
        ship_to_fax: @fax
      }
      hash.delete_if { |_k, v| v.nil? }
    end
  end
end
