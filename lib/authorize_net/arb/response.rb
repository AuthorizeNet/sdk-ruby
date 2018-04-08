module AuthorizeNet::ARB
  # The ARB response class.
  class Response < AuthorizeNet::XmlResponse
    # Constructs a new response object from a +raw_response. You don't typically
    # construct this object yourself, as AuthorizeNet::ARB::Transaction will
    # build one for you when it makes the request to the gateway.
    def initialize(raw_response, transaction)
      super
      unless connection_failure?
        begin
          @subscription_id = node_content_unless_nil(@root.at_css('subscriptionId'))
          @subscription_status = node_content_unless_nil(@root.at_css('Status'))
        rescue StandardError
          @raw_response = $ERROR_INFO
        end
      end
    end

    # Returns the subscriptionId from the response if there is one. Otherwise returns nil.
    attr_reader :subscription_id

    # Returns the status of the Subscription from the response if there is one. Otherwise returns nil. This value
    # is only returned in response to a get_status transaction.
    attr_reader :subscription_status
  end
end
