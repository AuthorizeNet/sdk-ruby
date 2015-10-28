module AuthorizeNet::Reporting

  # Models a fraud detection filter.
  class FDSFilter
    
    include AuthorizeNet::Model
    
    attr_accessor :name, :action
  end

end