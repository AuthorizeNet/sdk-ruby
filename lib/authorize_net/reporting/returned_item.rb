module AuthorizeNet::Reporting

  class ReturnedItem
    include AuthorizeNet::Model

    attr_accessor :id, :date_utc, :date_local, :code, :description, :returned_items

    def date_utc=(time)
      if time.kind_of?(DateTime)
        @date_utc = time
      else
        @date_utc = DateTime.parse(time.to_s)
      end
    end

    def date_local=(time)
      if time.kind_of?(DateTime)
        @date_local = time
      else
        @date_local = DateTime.parse(time.to_s)
      end
    end

    def add_returned_item(returned_item)
      @returned_items = @returned_items.to_a << returned_item
    end

    def to_hash
      hash = {
          :id => @id,
          :date_utc => @date_utc,
          :date_local => @date_local,
          :code => @code,
          :description => @description,
          :returned_items => handle_multivalue_hashing(@returned_items)
      }
      hash.delete_if { |k, v| v.nil? }
      hash
    end
  end
end