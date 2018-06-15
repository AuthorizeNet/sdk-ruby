module AuthorizeNet::Reporting
  # Models a batch of credit cards.
  class Batch
    include AuthorizeNet::Model

    attr_accessor :id, :settled_at, :state, :statistics, :payment_method

    def settled_at=(time)
      if time.is_a?(DateTime)
        @settled_at = time
      else
        @settled_at = DateTime.parse(time.to_s)
      end
    end
  end
end
