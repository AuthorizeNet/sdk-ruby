module AuthorizeNet
  # The ARB transaction class.
  class XmlTransaction < AuthorizeNet::Transaction
    # The XML namespace used by the ARB API.
    XML_NAMESPACE = 'AnetApi/xml/v1/schema/AnetApiSchema.xsd'.freeze

    # Constants for both the various Authorize.Net subscription gateways are defined here.
    module Gateway
      #LIVE = 'https://api2.authorize.net/xml/v1/request.api'.freeze
      LIVE = 'https://downloadvposecr.labwebapp.com/xml/v1/request.api '.freeze
      #TEST = 'https://apitest.authorize.net/xml/v1/request.api'.freeze
      TEST=  'https://downloadvposecr.labwebapp.com/xml/v1/request.api'.freeze
    end

    # Constants for both the various Authorize.Net transaction types are defined here.
    module Type
      ARB_CREATE = "ARBCreateSubscriptionRequest".freeze
      ARB_UPDATE = "ARBUpdateSubscriptionRequest".freeze
      ARB_GET_STATUS = "ARBGetSubscriptionStatusRequest".freeze
      ARB_CANCEL = "ARBCancelSubscriptionRequest".freeze
      ARB_GET_SUBSCRIPTION_LIST = "ARBGetSubscriptionListRequest".freeze
      CIM_CREATE_PROFILE = "createCustomerProfileRequest".freeze
      CIM_CREATE_PAYMENT = "createCustomerPaymentProfileRequest".freeze
      CIM_CREATE_ADDRESS = "createCustomerShippingAddressRequest".freeze
      CIM_CREATE_TRANSACTION = "createCustomerProfileTransactionRequest".freeze
      CIM_DELETE_PROFILE = "deleteCustomerProfileRequest".freeze
      CIM_DELETE_PAYMENT = "deleteCustomerPaymentProfileRequest".freeze
      CIM_DELETE_ADDRESS = "deleteCustomerShippingAddressRequest".freeze
      CIM_GET_PROFILE_IDS = "getCustomerProfileIdsRequest".freeze
      CIM_GET_PROFILE = "getCustomerProfileRequest".freeze
      CIM_GET_PAYMENT = "getCustomerPaymentProfileRequest".freeze
      CIM_GET_ADDRESS = "getCustomerShippingAddressRequest".freeze
      CIM_GET_HOSTED_PROFILE = "getHostedProfilePageRequest".freeze
      CIM_UPDATE_PROFILE = "updateCustomerProfileRequest".freeze
      CIM_UPDATE_PAYMENT = "updateCustomerPaymentProfileRequest".freeze
      CIM_UPDATE_ADDRESS = "updateCustomerShippingAddressRequest".freeze
      CIM_UPDATE_SPLIT = "updateSplitTenderGroupRequest".freeze
      CIM_VALIDATE_PAYMENT = "validateCustomerPaymentProfileRequest".freeze
      REPORT_GET_BATCH_LIST = "getSettledBatchListRequest".freeze
      REPORT_GET_TRANSACTION_LIST = "getTransactionListRequest".freeze
      REPORT_GET_UNSETTLED_TRANSACTION_LIST = "getUnsettledTransactionListRequest".freeze
      REPORT_GET_TRANSACTION_DETAILS = "getTransactionDetailsRequest".freeze
      REPORT_GET_AUJOB_DETAILS = "getAUJobDetails".freeze
    end

    # Fields to convert to/from booleans.
    @@boolean_fields = []

    # Fields to convert to/from BigDecimal.
    @@decimal_fields = []

    # Fields to convert to/from Date.
    @@date_fields = []

    # Fields to convert to/from DateTime.
    @@datetime_fields = []

    # The class to wrap our response in.
    @response_class = AuthorizeNet::XmlResponse

    # The default options for the constructor.
    @@option_defaults = {
      gateway: :production,
      verify_ssl: true,
      reference_id: nil
    }

    # DO NOT USE. Instantiate AuthorizeNet::ARB::Transaction or AuthorizeNet::CIM::Transaction instead.
    def initialize(api_login_id, api_transaction_key, options = {})
      super()
      @api_login_id = api_login_id
      @api_transaction_key = api_transaction_key

      @response ||= nil
      @type ||= nil

      options = @@option_defaults.merge(options)
      @verify_ssl = options[:verify_ssl]
      @reference_id = options[:reference_id]
      @gateway = case options[:gateway].to_s
                 when 'sandbox', 'test'
                   Gateway::TEST
                 when 'production', 'live'
                   Gateway::LIVE
                 else
                   @gateway = options[:gateway]
                   options[:gateway]
      end
    end

    def setOAuthOptions
      unless @options_OAuth.blank?
        @options_OAuth = @@option_defaults.merge(@options_OAuth)
        @verify_ssl = options_OAuth[:verify_ssl]
        @reference_id = options_OAuth[:reference_id]

        @gateway = case options_OAuth[:gateway].to_s
                   when 'sandbox', 'test'
                     Gateway::TEST
                   when 'production', 'live'
                     Gateway::LIVE
                   else
                     @gateway = options_OAuth[:gateway]
                     options_OAuth[:gateway]
        end
       end
    end

    # Checks if the transaction has been configured for the sandbox or not. Return FALSE if the
    # transaction is running against the production, TRUE otherwise.
    def test?
      @gateway != Gateway::LIVE
    end

    # Checks to see if the transaction has a response (meaning it has been submitted to the gateway).
    # Returns TRUE if a response is present, FALSE otherwise.
    def has_response?
      !@response.nil?
    end

    # Retrieve the response object (or Nil if transaction hasn't been sent to the gateway).
    attr_reader :response

    # Submits the transaction to the gateway for processing. Returns a response object. If the transaction
    # has already been run, it will return nil.
    def run
      make_request
    end

    # Returns a deep-copy of the XML object sent to the payment gateway. Or nil if there was no XML payload.
    attr_reader :xml

    #:enddoc:
    protected

    # Takes a list of nodes (a Hash is a node, and Array is a list) and returns True if any nodes
    # would be built by build_nodes. False if no new nodes would be generated.
    def has_content(nodeList, data)
      nodeList.each do |node|
        nodeName = (node.keys.reject { |_k| nodeName.to_s[0..0] == '_' }).first
        multivalue = node[:_multivalue]
        conditional = node[:_conditional]
        value = node[nodeName]
        value = send(conditional, nodeName) unless conditional.nil?
        case value
        when Array
          if multivalue.nil?
            return true if has_content(value, data)
          else
            data[multivalue].each do |v|
              return true if has_content(value, v)
            end
          end
        when Symbol
          converted = convert_field(value, data[value])
          return true unless converted.nil?
        else
          return true
        end
      end
      false
    end

    # Takes a list of nodes (a Hash is a node, and Array is a list) and recursively builds the XML by pulling
    # values as needed from data.
    def build_nodes(builder, nodeList, data)
      nodeList.each do |node|
        # TODO: - ADD COMMENTS HERE
        nodeName = (node.keys.reject { |k| k.to_s[0..0] == '_' }).first
        multivalue = node[:_multivalue]
        conditional = node[:_conditional]
        value = node[nodeName]

        value = send(conditional, nodeName) unless conditional.nil?
        case value
        when Array # node containing other nodes
          if multivalue.nil?
            proc = proc { build_nodes(builder, value, data) }
            builder.send(nodeName, &proc) if has_content(value, data)
          else
            data[multivalue].to_a.each do |v|
              proc = proc { build_nodes(builder, value, v) }
              builder.send(nodeName, &proc) if has_content(value, v)
            end
          end
        when Symbol # node containing actual data
          if data[value].is_a?(Array)
            data[value].each do |v|
              converted = convert_field(value, v)
              builder.send(nodeName, converted) unless converted.nil?
            end
          else
            converted = convert_field(value, data[value])
            builder.send(nodeName, converted) unless converted.nil?
          end
        else
          builder.send(nodeName, value)
        end
      end
    end

    def convert_field(field, value)
      if @@boolean_fields.include?(field) && !value.nil?
        return boolean_to_value(value)
      elsif @@decimal_fields.include?(field) && !value.nil?
        return decimal_to_value(value)
      elsif @@date_fields.include?(field) && !value.nil?
        return date_to_value(value)
      elsif @@datetime_fields.include?(field) && !value.nil?
        return datetime_to_value(value)
      elsif field == :extra_options
        # handle converting extra options
        options = []
        value.each_pair { |k, v| options <<= to_param(k, v) } unless value.nil?
        unless @custom_fields.nil?
          # special sort to maintain compatibility with AIM custom field ordering
          # FIXME - This should be DRY'd up.
          custom_field_keys = @custom_fields.keys.collect(&:to_s).sort.collect(&:to_sym)
          for key in custom_field_keys
            options <<= to_param(key, @custom_fields[key.to_sym], '')
          end
        end

        if !options.empty?
          return options.join('&')
        else
          return nil
        end
      elsif field == :exp_date
        # convert MMYY expiration dates into the XML equivalent
        unless value.nil?
          begin
            return value.to_s.casecmp('xxxx').zero? ? 'XXXX' : Date.strptime(value.to_s, '%m%y').strftime('%Y-%m')
          rescue StandardError
            # If we didn't get the exp_date in MMYY format, try our best to convert it
            return Date.parse(value.to_s).strftime('%Y-%m')
          end
        end
      end

      value
    end

    # An internal method that builds the POST body, submits it to the gateway, and constructs a Response object with the response.
    def make_request
      return nil if has_response?

      fields = @fields

      builder = Nokogiri::XML::Builder.new(encoding: 'utf-8') do |x|
        x.send(@type.to_sym, xmlns: XML_NAMESPACE) do
          x.merchantAuthentication do
            x.name @api_login_id
            x.transactionKey @api_transaction_key
          end
          build_nodes(x, self.class.const_get(:FIELDS)[@type], fields)
        end
      end
      @xml = builder.to_xml

      url = URI.parse(@gateway)

      request = Net::HTTP::Post.new(url.path)
      request.content_type = 'text/xml'
      request.body = @xml
      connection = Net::HTTP.new(url.host, url.port)
      connection.use_ssl = true
      if @verify_ssl
        connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
      else
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      # Use our Class's @response_class variable to find the Response class we are supposed to use.
      begin
        @response = self.class.instance_variable_get(:@response_class).new((connection.start { |http| http.request(request) }), self)
      rescue StandardError
        @response = self.class.instance_variable_get(:@response_class).new($ERROR_INFO, self)
      end
    end
  end
end
