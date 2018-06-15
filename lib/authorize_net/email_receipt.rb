module AuthorizeNet
  # Models an email receipt.
  class EmailReceipt
    include AuthorizeNet::Model

    attr_accessor :header, :footer, :merchant_email, :email_customer

    def to_hash
      hash = {
        header: @header,
        footer: @footer,
        merchant_email: @merchant_email,
        email_customer: @email_customer
      }
      hash.delete_if { |_k, v| v.nil? }
      hash.merge(@address.to_hash) unless @address.nil?
      hash
    end
  end
end
