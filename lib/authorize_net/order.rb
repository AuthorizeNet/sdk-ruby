module AuthorizeNet
  # Models an order.
  class Order
    include AuthorizeNet::Model

    attr_accessor :invoice_num, :description, :tax, :tax_name, :tax_description, :freight, :freight_name, :freight_description, :duty, :duty_name, :duty_description, :tax_exempt, :po_num, :line_items

    def add_line_item(id = nil, name = nil, description = nil, quantity = nil, price = nil, taxable = nil)
      if id.is_a?(AuthorizeNet::LineItem)
        line_item = id
      else
        line_item = AuthorizeNet::LineItem.new(id: id, name: name, description: description, quantity: quantity, price: price, taxable: taxable)
      end
      @line_items = @line_items.to_a << line_item
    end

    def to_hash
      hash = {
        invoice_num: @invoice_num,
        description: @description,
        tax: @tax,
        tax_name: @tax_name,
        tax_description: @tax_description,
        freight: @freight,
        freight_name: @freight_name,
        freight_description: @freight_description,
        duty: @duty,
        duty_name: @duty_name,
        duty_description: @duty_description,
        tax_exempt: @tax_exempt,
        po_num: @po_num,
        line_items: handle_multivalue_hashing(@line_items)
      }
      hash.delete_if { |_k, v| v.nil? }
      hash
    end
  end
end
