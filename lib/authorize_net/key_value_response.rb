module AuthorizeNet
  
  # The core, key/value response class. You shouldn't instantiate this one.
  # Instead you should use AuthorizeNet::AIM::Response or AuthorizeNet::SIM::Response.
  class KeyValueResponse < AuthorizeNet::Response
    
    # Defines constants for each response code.
    module ResponseCode
      APPROVED = '1'
      DECLINED = '2'
      ERROR = '3'
      HELD = '4'
    end
    
    # Defines constants for each address verification response code.
    module AVSResponseCode
      ADDRESS_MATCH_NOT_ZIP = 'A'
      NO_INFO = 'B'
      ERROR = 'E'
      NON_US = 'G'
      NO_MATCH = 'N'
      NOT_APPLICABLE = 'P'
      RETRY = 'R'
      NOT_SUPPOPRTED = 'S'
      UNAVAILABLE = 'U'
      ZIP9_MATCH_NOT_ADDRESS = 'W'
      ADDRESS_AND_ZIP9_MATCH = 'X'
      ADDRESS_AND_ZIP5_MATCH = 'Y'
      ZIP5_MATCH_NOT_ADDRESS = 'Z'
    end
    
    # Defines constants for each supported credit card type.
    module CardType
      VISA = 'Visa'
      MASTER_CARD = 'MasterCard'
      AMEX = 'American Express'
      DISCOVER = 'Discover'
      DINERS_CLUB = 'Diners Club'
      JCB = 'JCB'
    end
    
    # Defines constants for CCV code validation responses.
    module CCVResponseCode
      MATCH = 'M'
      NO_MATCH = 'N'
      NOT_PROCESSED = 'P'
      SHOULD_HAVE_BEEN_PRESENT = 'S'
      UNABLE_TO_PROCESS = 'U'
    end
    
    # Defines constants for CAVV code validation responses.
    module CAVVResponseCode
      ERRONEOUS_DATA = '0'
      FAILED_VALIDATION = '1'
      PASSED_VALIDATION = '2'
      ISSUER_ATTEMPT_INCOMPLETE = '3'
      ISSUER_SYSTEM_ERROR = '4'
      FAILED_ISSUER_AVAILABLE = '7'
      PASSED_ISSUER_AVAILABLE = '8'
      FAILED_ISSUER_UNAVAILABLE = '9'
      PASSED_ISSUER_UNAVAILABLE = 'A'
      PASSED_NO_LIABILITY_SHIFT = 'B'
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
    def fields
      @fields
    end
    
    # Returns all the custom fields returned in the response, keyed by their field name.
    def custom_fields
      @custom_fields
    end
    
  end
  
end