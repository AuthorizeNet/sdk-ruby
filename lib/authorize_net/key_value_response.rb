module AuthorizeNet
  # The core, key/value response class. You shouldn't instantiate this one.
  # Instead you should use AuthorizeNet::AIM::Response or AuthorizeNet::SIM::Response.
  class KeyValueResponse < AuthorizeNet::Response
    # Defines constants for each response code.
    module ResponseCode
      APPROVED = '1'.freeze
      DECLINED = '2'.freeze
      ERROR = '3'.freeze
      HELD = '4'.freeze
    end

    # Defines constants for each address verification response code.
    module AVSResponseCode
      ADDRESS_MATCH_NOT_ZIP = 'A'.freeze
      NO_INFO = 'B'.freeze
      ERROR = 'E'.freeze
      NON_US = 'G'.freeze
      NO_MATCH = 'N'.freeze
      NOT_APPLICABLE = 'P'.freeze
      RETRY = 'R'.freeze
      NOT_SUPPOPRTED = 'S'.freeze
      UNAVAILABLE = 'U'.freeze
      ZIP9_MATCH_NOT_ADDRESS = 'W'.freeze
      ADDRESS_AND_ZIP9_MATCH = 'X'.freeze
      ADDRESS_AND_ZIP5_MATCH = 'Y'.freeze
      ZIP5_MATCH_NOT_ADDRESS = 'Z'.freeze
    end

    # Defines constants for each supported credit card type.
    module CardType
      VISA = 'Visa'.freeze
      MASTER_CARD = 'MasterCard'.freeze
      AMEX = 'American Express'.freeze
      DISCOVER = 'Discover'.freeze
      DINERS_CLUB = 'Diners Club'.freeze
      JCB = 'JCB'.freeze
    end

    # Defines constants for CCV code validation responses.
    module CCVResponseCode
      MATCH = 'M'.freeze
      NO_MATCH = 'N'.freeze
      NOT_PROCESSED = 'P'.freeze
      SHOULD_HAVE_BEEN_PRESENT = 'S'.freeze
      UNABLE_TO_PROCESS = 'U'.freeze
    end

    # Defines constants for CAVV code validation responses.
    module CAVVResponseCode
      ERRONEOUS_DATA = '0'.freeze
      FAILED_VALIDATION = '1'.freeze
      PASSED_VALIDATION = '2'.freeze
      ISSUER_ATTEMPT_INCOMPLETE = '3'.freeze
      ISSUER_SYSTEM_ERROR = '4'.freeze
      FAILED_ISSUER_AVAILABLE = '7'.freeze
      PASSED_ISSUER_AVAILABLE = '8'.freeze
      FAILED_ISSUER_UNAVAILABLE = '9'.freeze
      PASSED_ISSUER_UNAVAILABLE = 'A'.freeze
      PASSED_NO_LIABILITY_SHIFT = 'B'.freeze
    end

    # Check to see if the transaction was approved.
    def approved?
      @fields[:response_code] == ResponseCode::APPROVED
    end

    # Check to see if the transaction was declined.
    def declined?
      @fields[:response_code] == ResponseCode::DECLINED
    end

    # Check to see if the transaction was returned with an error.
    def error?
      @fields[:response_code] == ResponseCode::ERROR
    end

    # Check to see if the transaction was held for review by Authorize.Net.
    def held?
      @fields[:response_code] == ResponseCode::HELD
    end

    # Returns the response code received from the gateway. Note: its better to use
    # success?, approved?, etc. to check the response code.
    def response_code
      @fields[:response_code]
    end

    # Returns the response reason code received from the gateway. This code can be used
    # to identify why something failed by referencing the AIM documentation.
    def response_reason_code
      @fields[:response_reason_code]
    end

    # Returns the response reason text received from the gateway. This is a brief, human readable
    # explanation of why you got the response code that you got. Note that these strings tend to be
    # a bit vague. More detail can be gleaned from the response_reason_code.
    def response_reason_text
      @fields[:response_reason_text]
    end

    # Returns all the fields returned in the response, keyed by their API name. Custom fields are NOT
    # included (see custom_fields).
    attr_reader :fields

    # Returns all the custom fields returned in the response, keyed by their field name.
    attr_reader :custom_fields
  end
end
