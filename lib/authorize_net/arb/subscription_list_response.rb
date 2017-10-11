module AuthorizeNet::ARB
  class SubscriptionListResponse < AuthorizeNet::XmlResponse
    # Constructs a new response object from a +raw_response. You don't typically
    # construct this object yourself, as AuthorizeNet::ARB::Transaction will
    # build one for you when it makes the request to the gateway.
    def initialize(raw_response, transaction)
      super
      unless connection_failure?
        begin
          @subscription_details = @root.at_css('subscriptionDetails')
          @subscription_detail = @root.at_css('subscriptionDetail')
          @total_num_in_resultset = node_content_unless_nil(@root.at_css('totalNumInResultSet'))
        rescue
          @raw_response = $ERROR_INFO
        end
      end
    end

    # Returns total number of subscriptions matching the search criteria
    attr_reader :total_num_in_resultset

    # Returns an Array of SubscriptionDetail objects built from the entities returned in the response. Returns nil if no subscriptions were returned.
    def subscription_details
      unless @subscription_details.nil?
        subscription_details = []
        @subscription_details.element_children.each do |child|
          next if child.nil?
          subscription_detail = build_entity(child, Fields::SUBSCRIPTION_DETAIL_ENTITY_DESCRIPTION)

          subscription_details <<= subscription_detail
        end
        return subscription_details unless subscription_details.empty?
       end
    end
  end
end
