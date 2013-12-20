module AuthorizeNet::SIM
  
  # Models a hosted receipt page.
  class HostedReceiptPage
    
    # Defines constants for each of the link methods used by the hosted receipt page.
    module LinkMethod
      LINK = 'LINK'
      POST = 'POST'
      GET = 'GET'
    end
    
    include AuthorizeNet::Model
    
    attr_accessor :header_html, :footer_html, :color_background, :color_link, :color_text, :logo_url, :background_url, :link_method, :link_text, :link_url
    
    
    def to_hash
      hash = {
        :header_html_receipt => @header_html,
        :footer_html_receipt => @footer_html,
        :color_background => @color_background,
        :color_link => @color_link,
        :color_text => @color_text,
        :logo_url => @logo_url,
        :background_url => @background_url,
        :receipt_link_method => @link_method,
        :receipt_link_text => @link_text,
        :receipt_link_url => @link_url
      }
      hash.delete_if {|k, v| v.nil?}
      hash
    end
  
  end
  
end