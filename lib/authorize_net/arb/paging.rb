module AuthorizeNet::ARB
  class Paging
    # Models Paging
    include AuthorizeNet::Model

    attr_accessor :offset, :limit

    # Initializes Paging object.
    #
    # Typical usage:
    #  paging = AuthorizeNet::ARB::Paging.new(1,1000)
    #
    # Valid values for offset: 1 to 100000
    # Valid values for limit: 1 to 1000
    #
    def initialize(offset, limit)
      @offset = offset
      @limit = limit
    end

    def to_hash
      hash = {
        offset: @offset,
        limit: @limit
      }
      hash.delete_if { |_k, v| v.nil? }
    end
  end
end
