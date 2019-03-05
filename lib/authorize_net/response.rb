module AuthorizeNet
  # The core, API agnostic response class.
  # You shouldn't instantiate this one.
  class Response
    include AuthorizeNet::TypeConversions

    # Fields to convert to/from booleans.
    @@boolean_fields = []

    # Fields to convert to/from BigDecimal.
    @@decimal_fields = []

    # DO NOT USE.
    def initialize
      raise "#{self.class} should not be instantiated directly."
    end

    # Check to see if the response indicated success.
    def success?
      false
    end
  end
end
