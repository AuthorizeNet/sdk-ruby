module AuthorizeNet::AIM
  # The AIM response class. Handles parsing the response from the gateway.
  class Response < AuthorizeNet::KeyValueResponse
    # Our MD5 digest generator.
    @@digest = OpenSSL::Digest.new('md5')

    include AuthorizeNet::AIM::Fields

    # Fields to convert to/from booleans.
    @@boolean_fields = [:tax_exempt]

    # Fields to convert to/from BigDecimal.
    @@decimal_fields = %i[amount tax freight duty requested balance_on_card]

    # Constructs a new response object from a +raw_response+ and the +transaction+ that generated
    # the +raw_response+. You don't typically construct this object yourself, as AuthorizeNet::AIM::Transaction
    # will build one for you when it makes the request to the gateway.
    def initialize(raw_response, transaction)
      @version = transaction.version
      raise "AuthorizeNet gem only supports AIM version 3.1" unless @version.to_s == '3.1'
      @raw_response = raw_response
      @fields = {}
      @transaction = transaction
      custom_field_names = transaction.custom_fields.keys.collect(&:to_s).sort.collect(&:to_sym)
      @custom_fields = {}
      split_on = transaction.delimiter
      if @raw_response.is_a?(Net::HTTPOK) || @raw_response.is_a?(Nokogiri::XML::Element)
        if @raw_response.is_a?(Net::HTTPOK)
          raw_data = @raw_response.body
        else
          raw_data = @raw_response.text
        end
        unless transaction.encapsulation_character.nil?
          split_on = transaction.encapsulation_character + split_on + transaction.encapsulation_character
          raw_data = raw_data[1..raw_data.length - 2]
        end
        raw_data.split(split_on).each_with_index do |field, index|
          if transaction.cp_version.nil?
            field_desc = FIELDS
          else
            field_desc = CP_FIELDS
          end
          if index < field_desc.length
            @fields[field_desc[index]] = field
          else
            @custom_fields[custom_field_names[index - field_desc.length]] = field
          end
        end
        @fields.delete(nil)
        @fields.each do |k, v|
          if @@boolean_fields.include?(k)
            @fields[k] = value_to_boolean(v)
          elsif @@decimal_fields.include?(k)
            @fields[k] = value_to_decimal(v)
          end
        end
      end
    end

    # Returns True if the MD5 hash found in the response payload validates using
    # the supplied api_login and secret merchant_value (THIS IS NOT YOUR API KEY).
    def valid_md5?(api_login, merchant_value)
      return false if @fields[:md5_hash].nil?
      @@digest.hexdigest("#{merchant_value}#{api_login}#{@fields[:transaction_id]}#{@transaction.fields[:amount]}").casecmp(@fields[:md5_hash].downcase).zero?
    end

    # Returns the current API version that we are adhering to.
    attr_reader :version

    # Check to see if the response indicated success. Success is defined as a 200 OK response indicating
    # that the transaction was approved.
    def success?
      !connection_failure? && approved?
    end

    # Returns true if we failed to open a connection to the gateway or got back a non-200 OK HTTP response.
    def connection_failure?
      !@raw_response.is_a?(Net::HTTPOK) && !@raw_response.is_a?(Nokogiri::XML::Element)
    end

    # Returns the underlying Net::HTTPResponse object. This has the original response body along with
    # headers and such. Note that if an exception is generated while making the request (which happens
    # if there is no internet connection for example), you will get the exception object here instead of
    # a Net::HTTPResponse object.
    def raw
      @raw_response
    end

    # Returns the AuthorizeNet::Transaction instance that owns this response.
    attr_reader :transaction

    # Returns the transaction's authorization code. This should be shown to the
    # end user.
    def authorization_code
      @fields[:authorization_code]
    end

    # Returns the transaction's authorization id. You will need this for future void, refund
    # and prior authorization capture requests.
    def transaction_id
      @fields[:transaction_id]
    end

    # Returns the customer id from the response.
    def customer_id
      @fields[:customer_id]
    end

    # Returns a response code (from AVSResponseCode) indicating the result of any Address Verification
    # Service checks.
    def avs_response
      @fields[:avs_response]
    end

    # Returns the credit card type used in the transaction. The values returned can be found in CardType.
    def card_type
      @fields[:card_type]
    end
  end
end
