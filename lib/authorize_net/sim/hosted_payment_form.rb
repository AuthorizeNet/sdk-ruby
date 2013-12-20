module AuthorizeNet::SIM
  
  # Models a hosted payment form.
  class HostedPaymentForm
    
    include AuthorizeNet::Model
    
    attr_accessor :header_html, :footer_html, :color_background, :color_link, :color_text, :logo_url, :background_url, :rename
    
    # Convenience method for adding field rename requests to the transaction. This renames a field shown on
    # the hosted payment form.
    def add_rename(field, name)
      rename = "#{field},#{name}"
      unless @rename.nil?
        @rename = @rename.to_a << rename
      else
        @rename = [rename]
      end
    end
    
    def to_hash
      hash = {
        :header_html_payment_form => @header_html,
        :footer_html_payment_form => @footer_html,
        :color_background => @color_background,
        :color_link => @color_link,
        :color_text => @color_text,
        :logo_url => @logo_url,
        :background_url => @background_url,
        :rename => @rename
      }
      hash.delete_if {|k, v| v.nil?}
      hash
    end
  
  end
  
end