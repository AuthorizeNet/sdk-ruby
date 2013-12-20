module AuthorizeNet::Reporting

  # Models the details of a transaction.
  class TransactionDetails
    
    include AuthorizeNet::Model
    
    attr_accessor :id, :submitted_at, :status, :order, :customer, :account_type,
                  :account_number, :settle_amount, :reference_id, :split_tender_id,
                  :type, :response_code, :response_reason_code, :response_reason_description,
                  :auth_code, :avs_response, :card_code_response, :cavv_response,
                  :fds_filter_action, :fds_filters, :batch, :prepaid_balance_remaining,
                  :payment_method, :recurring_billing, :bill_to, :ship_to, :auth_amount
    
    def submitted_at=(time)
      if time.kind_of?(DateTime)
        @submitted_at = time
      else
        @submitted_at = DateTime.parse(time.to_s)
      end
    end
    
  end

end