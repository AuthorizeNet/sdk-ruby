module AuthorizeNet::ARB
  class Sorting
    # Models Sorting
    include AuthorizeNet::Model

    attr_accessor :order_by, :order_descending

    # Initializes Sorting object.
    #
    # Typical usage:
    #  sorting = AuthorizeNet::ARB::Sorting.new('name',true)
    #
    # Valid values for order_by values of the AuthorizeNet::ARB::Sorting:
    #    id
    #    name
    #    status
    #    createTimeStampUTC
    #    lastName
    #    firstName
    #    accountNumber
    #    amount
    #    pastOccurrences
    #
    # Valid values for order_descending: true, false, 1, 0
    #
    def initialize(order_by, order_descending)
      @order_by = order_by
      @order_descending = order_descending
    end

    def to_hash
      hash = {
        order_by: @order_by,
        order_descending: @order_descending
      }
      hash.delete_if { |_k, v| v.nil? }
    end
  end
end
