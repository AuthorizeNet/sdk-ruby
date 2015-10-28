module AuthorizeNet::Reporting

  # The Reporting API transaction class.
  class Transaction < AuthorizeNet::XmlTransaction
    
    include AuthorizeNet::Reporting::Fields
    
    # The class to wrap our response in.
    @response_class = AuthorizeNet::Reporting::Response
    
    # Fields to convert to/from Date.
    @@datetime_fields = [:first_settlement_date, :last_settlement_date]
    
    # Constructs a Reporting transaction. You can use the new Reporting transaction object
    # to issue a request to the payment gateway and parse the response into a new
    # AuthorizeNet::Reporting::Response object.
    # 
    # +api_login_id+:: Your API login ID, as a string.
    # +api_transaction_key+:: Your API transaction key, as a string.
    # +options+:: A hash of options. See below for values.
    # 
    # Options
    # +gateway+:: The gateway to submit the transaction to. Can be a URL string, an AuthorizeNet::Reporting::Transaction::Gateway constant, or one of the convenience symbols :sandbox, :test, :production, or :live (:test is an alias for :sandbox, and :live is an alias for :production). 
    # +verify_ssl+:: A boolean indicating if the SSL certificate of the +gateway+ should be verified. Defaults to true.
    # +reference_id+:: A string that can be used to identify a particular transaction with its response. Will be echo'd in the response, only if it was provided in the transaction. Defaults to nil.
    #
    def initialize(api_login_id, api_transaction_key, options = {})
      super
    end
    
    # Sets up and submits a getSettledBatchListRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::Reporting::Response object. The
    # response object will have an array of Batch objects available via its batch_list method if
    # the request was successful.
    # 
    #
    # +from_date+:: Takes either a DateTime or a String representing a date and time. Only settled batches >= this value will be returned. Defaults to nil (which returns >= 24hrs ago). A to_date must be specified if a from_date is.
    # +to_date+:: Takes either a DateTime or a String representing a date and time. Only settled batches <= this value will be returned. Defaults to nil. The maximum date range is 31 days, and a from_date must be supplied if a to_date is.
    # +include_stats+:: Takes a Boolean. Determines if BatchStatistics should be returned with the Batch objects. Defaults to false.
    #
    # Typical usage:
    # 
    #   response = transaction.get_settled_batch_list(DateTime.now() - (1 * 3600 * 48), DateTime.now(), true)
    #   batches = response.batch_list if response.success?
    #
    def get_settled_batch_list(from_date = nil, to_date = nil, include_stats = false)
      @type = Type::REPORT_GET_BATCH_LIST
      set_fields({:first_settlement_date => from_date, :last_settlement_date => to_date, :include_statistics => include_stats})
      make_request
    end
    
    # Sets up and submits a getTransactionListRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::Reporting::Response object. The
    # response object will have an array of TransactionDetail objects available via its transactions method if
    # the request was successful. These TransactionDetail objects will not be fully populated. Use get_transaction_details
    # to get all the details.
    # 
    #
    # +batch_id+:: Takes either a Batch object with its id attribute populated, or a String representing the ID of the batch to retrieve the transaction list from.
    #
    # Typical usage:
    # 
    #   response = transaction.get_transaction_list('123456')
    #   transactions = response.transactions if response.success?
    #
    def get_transaction_list(batch_id)
      @type = Type::REPORT_GET_TRANSACTION_LIST
      handle_batch_id(batch_id)
      make_request
    end
    
    # Sets up and submits a getUnsettledTransactionListRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::Reporting::Response object. The
    # response object will have an array of TransactionDetail objects available via its transactions method if
    # the request was successful. These TransactionDetail objects will not be fully populated. Use get_transaction_details
    # to get all the details.
    # 
    #
    # Typical usage:
    # 
    #   response = transaction.get_unsettled_transaction_list
    #   transactions = response.transactions if response.success?
    #
    def get_unsettled_transaction_list
      @type = Type::REPORT_GET_UNSETTLED_TRANSACTION_LIST
      make_request
    end

    # Sets up and submits a getTransactionDetailsRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::Reporting::Response object. The
    # response object will have a TransactionDetail object available via its transactions method if
    # the request was successful. This TransactionDetail object will have more data than the limited version
    # returned by get_transaction_list.
    # 
    #
    # +transaction_id+:: Takes either a TransactionDetail object with its id attribute populated, or a String representing the ID of the transaction to retrieve the details from.
    #
    # Typical usage:
    # 
    #   response = transaction.get_transaction_details('123456789')
    #   transactions = response.transactions if response.success?
    #
    def get_transaction_details(transaction_id)
      @type = Type::REPORT_GET_TRANSACTION_DETAILS
      handle_transaction_id(transaction_id)
      make_request
    end
    
    #:enddoc:
    protected
    
    # Handles batch id type massaging.
    def handle_batch_id(id)
      case id
      when Batch
        set_fields(:batch_id => id.id.to_s)
      else
        set_fields(:batch_id => id.to_s)
      end
    end
    
    # Handles transaction id type massaging.
    def handle_transaction_id(id)
      case id
      when TransactionDetails
        set_fields(:transaction_id => id.id.to_s)
      else
        set_fields(:transaction_id => id.to_s)
      end
    end
  end
  
end
