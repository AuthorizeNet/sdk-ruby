module AuthorizeNet::ARB
  # Models Subscription Detail.
  class SubscriptionDetail
    include AuthorizeNet::Model

    attr_accessor :id, :name, :status, :create_time_stamp_utc, :first_name,
                  :last_name, :total_occurrences, :past_occurrences,
                  :payment_method, :account_number, :invoice, :amount, :currency_id
  end
end
