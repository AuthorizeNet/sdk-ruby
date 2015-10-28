module AuthorizeNet
  
  # Models an line item.
  class LineItem
    
    include AuthorizeNet::Model
    
    attr_accessor :id, :name, :description, :quantity, :price, :taxable
    
    def to_hash
      hash = {
        :line_item_id => @id,
        :line_item_name => @name,
        :line_item_description => @description,
        :line_item_quantity => @quantity,
        :line_item_price => @price,
        :line_item_taxable => @taxable
      }
      hash.delete_if {|k, v| v.nil?}
      hash
    end
    
  end
  
end