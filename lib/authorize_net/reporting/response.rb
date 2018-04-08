module AuthorizeNet::Reporting
  # The CIM response class.
  class Response < AuthorizeNet::XmlResponse
    include AuthorizeNet::CIM::Fields

    # Constructs a new response object from raw_response in the context of transaction.
    # You don‘t typically construct this object yourself, as AuthorizeNet::Reeporting::Transaction
    # will build one for you when it makes the request to the gateway.
    def initialize(raw_response, transaction)
      super
      unless connection_failure?
        begin
          @batch_list = @root.at_css('batchList')
          @transactions = @root.at_css('transactions')
          @transaction = @root.at_css('transaction')
        rescue StandardError
          @raw_response = $ERROR_INFO
        end
      end
    end

    # Returns an Array of Batch objects built from the entities returned in the response. Returns nil if no batchList was returned.
    def batch_list
      unless @batch_list.nil?
        batches = []
        @batch_list.element_children.each do |child|
          batches <<= build_entity(child, Fields::BATCH_ENTITY_DESCRIPTION) unless child.nil?
        end
        return batches unless batches.empty?
      end
    end

    # Returns an Array of TransactionDetail objects built from the entities returned in the response. Returns nil if no transactions were returned.
    def transactions
      unless @transactions.nil?
        transactions = []
        @transactions.element_children.each do |child|
          next if child.nil?
          transaction = build_entity(child, Fields::TRANSACTION_DETAILS_ENTITY_DESCRIPTION)

          # handle some stuff thats too tricky for EntityDecription to handle
          first_name = node_content_unless_nil(child.at_css('firstName'))
          last_name = node_content_unless_nil(child.at_css('lastName'))
          unless first_name.nil? && last_name.nil?
            address = AuthorizeNet::Address.new(first_name: first_name, last_name: last_name)
            transaction.customer = AuthorizeNet::Customer.new(address: address)
          end
          invoice_number = node_content_unless_nil(child.at_css('invoiceNumber'))
          unless invoice_number.nil?
            transaction.order = AuthorizeNet::Order.new(invoice_num: invoice_number)
          end
          subscription = child.at_css('subscription')
          unless subscription.nil?
            subscription_id = node_content_unless_nil(child.at_css('subscription').at_css('id'))
            transaction.subscription_id = subscription_id unless subscription_id.nil?

            pay_num = node_content_unless_nil(child.at_css('subscription').at_css('payNum'))
            transaction.subscription_paynum = pay_num unless pay_num.nil?
          end

          transactions <<= transaction
        end
        return transactions unless transactions.empty?
      end
    end

    # Builds and returns a TransactionDetail entity built from the response. If no transaction was found, returns nil.
    def transaction
      unless @transaction.nil?
        transaction = build_entity(@transaction, Fields::TRANSACTION_DETAILS_ENTITY_DESCRIPTION)

        ip = node_content_unless_nil(@transaction.at_css('customerIP'))
        unless ip.nil?
          transaction.customer ||= AuthorizeNet::CIM::CustomerProfile.new
          transaction.customer.ip = ip
        end

        tax_exempt = node_content_unless_nil(@transaction.at_css('taxExempt'))
        unless tax_exempt.nil?
          transaction.order ||= AuthorizeNet::Order.new
          transaction.order.tax_exempt = value_to_boolean(tax_exempt)
        end

        tax = @transaction.at_css('tax')
        unless tax.nil?
          transaction.order ||= AuthorizeNet::Order.new
          tax_amount = node_content_unless_nil(tax.at_css('amount'))
          transaction.order.tax_amount = value_to_decimal(tax_amount) unless tax_amount.nil?
          transaction.order.tax_name = node_content_unless_nil(tax.at_css('name'))
          transaction.order.tax_description = node_content_unless_nil(tax.at_css('description'))
        end

        shipping = @transaction.at_css('shipping')
        unless shipping.nil?
          transaction.order ||= AuthorizeNet::Order.new
          shipping_amount = node_content_unless_nil(shipping.at_css('amount'))
          transaction.order.shipping_amount = value_to_decimal(shipping_amount) unless shipping_amount.nil?
          transaction.order.shipping_name = node_content_unless_nil(shipping.at_css('name'))
          transaction.order.shipping_description = node_content_unless_nil(shipping.at_css('description'))
        end

        duty = @transaction.at_css('duty')
        unless duty.nil?
          transaction.order ||= AuthorizeNet::Order.new
          duty_amount = node_content_unless_nil(duty.at_css('amount'))
          transaction.order.duty_amount = value_to_decimal(duty_amount) unless duty_amount.nil?
          transaction.order.duty_name = node_content_unless_nil(duty.at_css('name'))
          transaction.order.duty_description = node_content_unless_nil(duty.at_css('description'))
        end

        line_items = @transaction.at_css('lineItems')
        unless line_items.nil?
          transaction.order ||= AuthorizeNet::Order.new
          line_items.element_children.each do |child|
            line_item = build_entity(child, Fields::LINE_ITEM_ENTITY_DESCRIPTION)
            transaction.order.add_line_item(line_item)
          end
        end

        # Really not sure what to do with customer type here. It should go on a payment
        customer_type = node_content_unless_nil(@transaction.at_css('customer type'))
        unless customer_type.nil?
          transaction.customer ||= AuthorizeNet::CIM::CustomerProfile.new
          transaction.customer.payment_profiles = [AuthorizeNet::CIM::PaymentProfile.new(cust_type: customer_type)]
        end

        subscription = @transaction.at_css('subscription')
        unless subscription.nil?
          subscription_id = node_content_unless_nil(@transaction.at_css('subscription').at_css('id'))
          transaction.subscription_id = value_to_decimal(subscription_id) unless subscription_id.nil?

          pay_num = node_content_unless_nil(@transaction.at_css('subscription').at_css('payNum'))
          transaction.subscription_paynum = value_to_decimal(pay_num) unless pay_num.nil?
        end

        solution = @transaction.at_css('solution')
        unless solution.nil?
          solution_id = node_content_unless_nil(@transaction.at_css('solution').at_css('id'))
          transaction.solution_id = value_to_decimal(solution_id) unless solution_id.nil?

          transaction.solution_name = node_content_unless_nil(@transaction.at_css('solution').at_css('name'))
        end

        returned_items = @transaction.at_css('returnedItems')
        unless returned_items.nil?
          transaction.returns ||= AuthorizeNet::Reporting::ReturnedItem.new
          returned_items.element_children.each do |child|
            returned_item = build_entity(child, Fields::RETURNED_ITEM_ENTITY_DESCRIPTION)
            transaction.returns.add_returned_item(returned_item)
          end
        end

        transaction
      end
    end
  end
end
