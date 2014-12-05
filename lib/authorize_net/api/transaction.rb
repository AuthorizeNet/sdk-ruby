module AuthorizeNet::API
  class Transaction < ApiTransaction    
        
    def initialize(api_login_id, api_transaction_key, options = {})
       super
    end
       
    def create_transaction(request)
      @type = Type::API_CREATE_TRANSACTION      
      make_request(request,CreateTransactionResponse)
    end

  end
end