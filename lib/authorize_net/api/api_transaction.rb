module AuthorizeNet::API
  class ApiTransaction < AuthorizeNet::XmlTransaction
    module Type
      API_CREATE_TRANSACTION = "createTransactionRequest".freeze
      API_UPDATE_SPLIT_TENDER_GROUP = "updateSplitTenderGroupRequest".freeze

      API_CREATE_SUBSCRIPTION = "ARBCreateSubscriptionRequest".freeze
      API_UPDATE_SUBSCRIPTION = "ARBUpdateSubscriptionRequest".freeze
      API_CANCEL_SUBSCRIPTION = "ARBCancelSubscriptionRequest".freeze
      API_GET_SUBSCRIPTION_STATUS = "ARBGetSubscriptionStatusRequest".freeze
      API_GET_SUBSCRIPTION_LIST = "ARBGetSubscriptionListRequest".freeze

      API_GET_CUSTOMER_PROFILE_IDS = "getCustomerProfileIdsRequest".freeze

      API_CREATE_CUSTOMER_PROFILE = "createCustomerProfileRequest".freeze
      API_GET_CUSTOMER_PROFILE = "getCustomerProfileRequest".freeze
      API_UPDATE_CUSTOMER_PROFILE = "updateCustomerProfileRequest".freeze
      API_DELETE_CUSTOMER_PROFILE = "deleteCustomerProfileRequest".freeze

      API_CREATE_CUSTOMER_PAYMENT_PROFILE = "createCustomerPaymentProfileRequest".freeze
      API_GET_CUSTOMER_PAYMENT_PROFILE = "getCustomerPaymentProfileRequest".freeze
      API_UPDATE_CUSTOMER_PAYMENT_PROFILE = "updateCustomerPaymentProfileRequest".freeze
      API_VALIDATE_CUSTOMER_PAYMENT_PROFILE = "validateCustomerPaymentProfileRequest".freeze
      API_DELETE_CUSTOMER_PAYMENT_PROFILE = "deleteCustomerPaymentProfileRequest".freeze

      API_CREATE_CUSTOMER_SHIPPING_PROFILE = "createCustomerShippingAddressRequest".freeze
      API_GET_CUSTOMER_SHIPPING_PROFILE = "getCustomerShippingAddressRequest".freeze
      API_UPDATE_CUSTOMER_SHIPPING_PROFILE = "updateCustomerShippingAddressRequest".freeze
      API_DELETE_CUSTOMER_SHIPPING_PROFILE = "deleteCustomerShippingAddressRequest".freeze

      API_CREATE_CUSTOMER_PROFILE_FROM_TRANSACTION = "createCustomerProfileFromTransactionRequest".freeze

      API_GET_SETTLED_BATCH_LIST = "getSettledBatchListRequest".freeze
      API_GET_TRANSACTION_LIST = "getTransactionListRequest".freeze
      API_GET_TRANSACTION_DETAILS = "getTransactionDetailsRequest".freeze
      API_GET_UNSETTLED_TRANSACTION_LIST = "getUnsettledTransactionListRequest".freeze
      API_GET_BATCH_STATISTICS = "getBatchStatisticsRequest".freeze
      API_GET_TRANSACTION_LIST_FOR_CUSTOMER = "getTransactionListForCustomerRequest".freeze
      API_GET_AUJOB_DETAILS = "getaujobdetailsRequest".freeze


      API_GET_HOSTED_PROFILE_PAGE = "getHostedProfilePageRequest".freeze

      API_DECRYPT_PAYMENT_DATA = "decryptPaymentDataRequest".freeze
      API_AUTHENTICATE_TEST_REQUEST = "authenticateTestRequest".freeze

      API_GET_CUSTOMER_PAYMENT_PROFILE_LIST = "getCustomerPaymentProfileListRequest".freeze

      API_ARB_GET_SUBSCRIPTION_REQUEST = "ARBGetSubscriptionRequest".freeze

      API_GET_MERCHANT_DETAILS = "getMerchantDetailsRequest".freeze
      API_GET_HOSTED_PAYMENT_PAGE = "getHostedPaymentPageRequest".freeze
      API_UDPATE_HELD_TRANSACTION = "updateHeldTransactionRequest".freeze
      API_UPDATE_MERCHANT_DETAILS = "updateMerchantDetailsRequest".freeze
    end

    def initialize(api_login_id = nil, api_transaction_key = nil, options = {})
      super
    end

    def setOAuthOptions
      super
  end

    def make_request(request, responseClass, type)
      setOAuthOptions
      responseClass.roxml_attrs[4].instance_variable_set('@name','auDetails')#added for audetails fiels
      unless responseClass.nil? || request.nil?
        begin
          @xml = serialize(request, type)
          respXml = send_request(@xml)
          @response = deserialize(respXml.body, responseClass)
        rescue Exception => ex
          ex
        end
        end
    end

    def serialize(object, type)
      doc = Nokogiri::XML::Document.new
      doc.root = object.to_xml
      constants = YAML.load_file(File.dirname(__FILE__) + "/constants.yml")
      clientId = constants['clientId']

      builder = Nokogiri::XML::Builder.new(encoding: 'utf-8') do |x|
        x.send(type.to_sym, xmlns: XML_NAMESPACE) do
          x.merchantAuthentication do
            x.accessToken @access_token unless @access_token.blank?
            if !@api_login_id.blank? || (@access_token.blank? && @api_login_id.blank?)
              x.name @api_login_id
              x.transactionKey @api_transaction_key
            end
          end
          x.clientId clientId
          x.send :insert, doc.root.element_children
        end
      end
      builder.to_xml
    end

    def send_request(xml)
      url = URI.parse(@gateway)

      httpRequest = Net::HTTP::Post.new(url.path)
      httpRequest.content_type = 'text/xml'
      httpRequest.body = xml
      connection = Net::HTTP.new(url.host, url.port)
      connection.use_ssl = true
      if @verify_ssl
        connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
      else
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      response = connection.start { |http| http.request(httpRequest) }
    end

    def deserialize(xml, responseClass)
      responseClass.from_xml(xml)
    end
  end
end
