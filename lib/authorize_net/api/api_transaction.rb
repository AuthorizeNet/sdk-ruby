module AuthorizeNet::API
  class ApiTransaction < AuthorizeNet::XmlTransaction
    
    module Type
      API_CREATE_TRANSACTION = "createTransactionRequest"
      API_UPDATE_SPLIT_TENDER_GROUP = "updateSplitTenderGroupRequest"

      API_CREATE_SUBSCRIPTION = "ARBCreateSubscriptionRequest"
      API_UPDATE_SUBSCRIPTION = "ARBUpdateSubscriptionRequest"
      API_CANCEL_SUBSCRIPTION = "ARBCancelSubscriptionRequest"
      API_GET_SUBSCRIPTION_STATUS = "ARBGetSubscriptionStatusRequest"
      API_GET_SUBSCRIPTION_LIST = "ARBGetSubscriptionListRequest"

      API_GET_CUSTOMER_PROFILE_IDS = "getCustomerProfileIdsRequest"

      API_CREATE_CUSTOMER_PROFILE = "createCustomerProfileRequest"
      API_GET_CUSTOMER_PROFILE = "getCustomerProfileRequest"
      API_UPDATE_CUSTOMER_PROFILE = "updateCustomerProfileRequest"
      API_DELETE_CUSTOMER_PROFILE = "deleteCustomerProfileRequest"

      API_CREATE_CUSTOMER_PAYMENT_PROFILE = "createCustomerPaymentProfileRequest"
      API_GET_CUSTOMER_PAYMENT_PROFILE = "getCustomerPaymentProfileRequest"
      API_UPDATE_CUSTOMER_PAYMENT_PROFILE = "updateCustomerPaymentProfileRequest"
      API_VALIDATE_CUSTOMER_PAYMENT_PROFILE = "validateCustomerPaymentProfileRequest"
      API_DELETE_CUSTOMER_PAYMENT_PROFILE = "deleteCustomerPaymentProfileRequest"

      API_CREATE_CUSTOMER_SHIPPING_PROFILE = "createCustomerShippingAddressRequest"
      API_GET_CUSTOMER_SHIPPING_PROFILE = "getCustomerShippingAddressRequest"
      API_UPDATE_CUSTOMER_SHIPPING_PROFILE = "updateCustomerShippingAddressRequest"
      API_DELETE_CUSTOMER_SHIPPING_PROFILE = "deleteCustomerShippingAddressRequest"

      API_CREATE_CUSTOMER_PROFILE_FROM_TRANSACTION = "createCustomerProfileFromTransactionRequest"

      API_GET_SETTLED_BATCH_LIST = "getSettledBatchListRequest"
      API_GET_TRANSACTION_LIST = "getTransactionListRequest"
      API_GET_TRANSACTION_DETAILS = "getTransactionDetailsRequest"
      API_GET_UNSETTLED_TRANSACTION_LIST = "getUnsettledTransactionListRequest"
      API_GET_BATCH_STATISTICS = "getBatchStatisticsRequest"
	  
      API_GET_HOSTED_PROFILE_PAGE = "getHostedProfilePageRequest"


      API_DECRYPT_PAYMENT_DATA = "decryptPaymentDataRequest"
      API_AUTHENTICATE_TEST_REQUEST = "authenticateTestRequest"
      
      API_GET_CUSTOMER_PAYMENT_PROFILE_LIST = "getCustomerPaymentProfileListRequest"
      
      API_ARB_GET_SUBSCRIPTION_REQUEST = "ARBGetSubscriptionRequest"

      API_GET_MERCHANT_DETAILS = "getMerchantDetailsRequest"
      API_GET_HOSTED_PAYMENT_PAGE = "getHostedPaymentPageRequest"
      API_UDPATE_HELD_TRANSACTION = "updateHeldTransactionRequest"

    end
    
    def initialize(api_login_id, api_transaction_key, options = {})
       super
    end
    
    def make_request(request,responseClass,type)
     unless responseClass.nil? or request.nil?
       begin
        @xml = serialize(request,type)
        respXml = send_request(@xml)
        @response = deserialize(respXml.body,responseClass) 
       rescue Exception => ex  
          ex  
       end 
     end
    end
    
    def serialize(object,type)
      doc = Nokogiri::XML::Document.new
      doc.root = object.to_xml
      constants = YAML.load_file(File.dirname(__FILE__) + "/constants.yml")
      clientId = constants['clientId']

      builder = Nokogiri::XML::Builder.new(:encoding => 'utf-8') do |x|
        x.send(type.to_sym, :xmlns => XML_NAMESPACE) {
          x.merchantAuthentication {
            x.name @api_login_id
            x.transactionKey @api_transaction_key
            }
          x.clientId clientId
         x.send:insert, doc.root.element_children
      }
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
      
      response = connection.start {|http| http.request(httpRequest)}
    end
    
    def deserialize(xml,responseClass)
      responseClass.from_xml(xml)
    end
  end
end
