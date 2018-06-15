module AuthorizeNet::ARB
  module Fields
    EntityDescription = Struct.new(:node_structure, :entity_class, :arg_mapping)

    SUBSCRIPTION_DETAIL_ENTITY_DESCRIPTION = EntityDescription.new(
      [
        { id: :id },
        { name: :name },
        { status: :status },
        { createTimeStampUTC: :create_time_stamp_utc },
        { firstName: :first_name },
        { lastName: :last_name },
        { totalOccurrences: :total_occurrences },
        { pastOccurrences: :past_occurrences },
        { paymentMethod: :payment_method },
        { accountNumber: :account_number },
        { invoice: :invoice },
        { amount: :amount },
        { currencyId: :currency_id }
      ],
      AuthorizeNet::ARB::SubscriptionDetail
    )
  end
end
