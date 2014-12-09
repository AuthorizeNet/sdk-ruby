module AuthorizeNet::API
  class Transaction < ApiTransaction    
        
    def initialize(api_login_id, api_transaction_key, options = {})
       super
    end
       
    def create_transaction(request)  
      make_request(request,CreateTransactionResponse,Type::API_CREATE_TRANSACTION)
    end

  end
end