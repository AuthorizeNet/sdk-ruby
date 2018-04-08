module AuthorizeNet::Reporting
  class ReturnedItem
    include AuthorizeNet::Model

    attr_accessor :id, :date_utc, :date_local, :code, :description, :returned_items

    def date_utc=(time)
      if time.is_a?(DateTime)
        @date_utc = time
      else
        @date_utc = DateTime.parse(time.to_s)
      end
    end

    def date_local=(time)
      if time.is_a?(DateTime)
        @date_local = time
      else
        @date_local = DateTime.parse(time.to_s)
      end
    end

    def add_returned_item(id = nil, date_utc = nil, date_local = nil, code = nil, description = nil)
      if id.is_a?(AuthorizeNet::Reporting::ReturnedItem)
        returned_item = id
      else
        returned_item = AuthorizeNet::Reporting::ReturnedItem.new(return_item_id: id, return_item_date_utc: date_utc, return_item_date_local: date_local, return_item_code: code, line_item_description: description)
      end
      @returned_items = @returned_items.to_a << returned_item
    end

    def to_hash
      hash = {
        id: @id,
        date_utc: @date_utc,
        date_local: @date_local,
        code: @code,
        description: @description,
        returned_items: handle_multivalue_hashing(@returned_items)
      }
      hash.delete_if { |_k, v| v.nil? }
      hash
    end
  end
end
