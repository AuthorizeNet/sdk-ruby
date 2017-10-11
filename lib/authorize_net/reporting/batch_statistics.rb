module AuthorizeNet::Reporting
  # Models a batch of credit cards.
  class BatchStatistics
    include AuthorizeNet::Model

    attr_accessor :account_type, :charge_count, :charge_amount, :refund_count,
                  :refund_amount, :void_count, :decline_count, :error_count,
                  :returned_item_amount, :returned_item_count, :chargeback_count,
                  :chargeback_amount, :correction_notice_count, :charge_chageback_count,
                  :charge_chargeback_amount, :refund_chargeback_amount,
                  :refund_chargeback_count, :charge_returned_items_amount,
                  :charge_returned_items_count, :refund_returned_items_amount,
                  :refund_returned_items_count
  end
end
