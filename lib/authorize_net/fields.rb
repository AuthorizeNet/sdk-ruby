module AuthorizeNet
  
  EntityDescription = Struct.new(:node_structure, :entity_class, :arg_mapping)
  
  module AIM
    # Contains the various lists of fields needed by the AIM API.
    module Fields
  
      # Enumeration of the fields found in the AIM response. The index
      # of the field name corresponds to its position (+ 1) in the AIM response.
      FIELDS = [
        :response_code,
        :response_subcode,
        :response_reason_code,
        :response_reason_text,
        :authorization_code,
        :avs_response,
        :transaction_id,
        :invoice_number,
        :description,
        :amount,
        :method,
        :transaction_type,
        :customer_id,
        :first_name,
        :last_name,
        :company,
        :address,
        :city,
        :state,
        :zip_code,
        :country,
        :phone,
        :fax,
        :email_address,
        :ship_to_first_name,
        :ship_to_last_name,
        :ship_to_company,
        :ship_to_address,
        :ship_to_city,
        :ship_to_state,
        :ship_to_zip_code,
        :ship_to_country,
        :tax,
        :duty,
        :freight,
        :tax_exempt,
        :purchase_order_number,
        :md5_hash,
        :card_code_response,
        :cardholder_authentication_verification_response,
        :solution_id,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        :account_number,
        :card_type,
        :split_tender_id,
        :requested,
        :balance_on_card,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil # Merchant defined fields come after this field (68)
      ]
      
      # Enumeration of the fields found in the card present AIM response. The index
      # of the field name corresponds to its position (+ 1) in the card present AIM response.
      CP_FIELDS = [
        :cp_version,
        :response_code,
        :response_reason_code,
        :response_reason_text,
        :authorization_code,
        :avs_response,
        :card_code_response,
        :transaction_id,
        :md5_hash,
        :reference_id,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        nil,
        :account_number,
        :card_type,
        :split_tender_id,
        :requested,
        :approved_amount,
        :balance_on_card
      ]
    end
  end
   
  module SIM
    # Contains the various lists of fields needed by the SIM API.
    module Fields
      # List of the fields found in a SIM response. Any field not in this list
      # is treated as a Merchant Defined Field.
      FIELDS = [
        :x_response_code,
        :x_response_subcode,
        :x_response_reason_code,
        :x_response_reason_text,
        :x_auth_code,
        :x_avs_code,
        :x_trans_id,
        :x_invoice_num,
        :x_description,
        :x_amount,
        :x_method,
        :x_type,
        :x_cust_id,
        :x_first_name,
        :x_last_name,
        :x_company,
        :x_address,
        :x_city,
        :x_state,
        :x_zip,
        :x_country,
        :x_phone,
        :x_fax,
        :x_email,
        :x_ship_to_first_name,
        :x_ship_to_last_name,
        :x_ship_to_company,
        :x_ship_to_address,
        :x_ship_to_city,
        :x_ship_to_state,
        :x_ship_to_zip,
        :x_ship_to_country,
        :x_tax,
        :x_duty,
        :x_freight,
        :x_tax_exempt,
        :x_po_num,
        :x_MD5_Hash,
        :x_cvv2_resp_code,
        :x_cavv_response
      ]
    end
  end
  
  module ARB
    # Contains the various lists of fields needed by the ARB API.
    module Fields

      # Describes the order and nesting of fields in the ARB Subscription XML.
      SUBSCRIPTION_FIELDS = {:subscription => [
        {:name => :subscription_name},
        {:paymentSchedule => [
          {:interval => [
            {:length => :subscription_length},
            {:unit => :subscription_unit}
          ]},
          {:startDate => :subscription_start_date},
          {:totalOccurrences => :subscription_total_occurrences},
          {:trialOccurrences => :subscription_trial_occurrences}
        ]},
        {:amount => :subscription_amount},
        {:trialAmount => :subscription_trial_amount},
        {:payment => [
          {:creditCard => [
            {:cardNumber => :card_num},
            {:expirationDate => :exp_date},
            {:cardCode => :card_code}
          ]},
          {:opaqueData => [
            {:dataDescriptor => :opaque_data_descriptor},
            {:dataValue => :opaque_data_value}
          ]},
          {:bankAccount => [
            {:accountType => :bank_acct_type},
            {:routingNumber => :bank_aba_code},
            {:accountNumber => :bank_acct_num},
            {:nameOnAccount => :bank_acct_name},
            {:echeckType => :echeck_type},
            {:bankName => :bank_name}
          ]}
        ]},
        {:order => [
          {:invoiceNumber => :invoice_num},
          {:description => :description}
        ]},
        {:customer => [
          {:id_ => :cust_id},
          {:email => :email},
          {:phoneNumber => :phone},
          {:faxNumber => :fax}
        ]},
        {:billTo  => [
          {:firstName => :first_name},
          {:lastName => :last_name},
          {:company => :company},
          {:address => :address},
          {:city => :city},
          {:state => :state},
          {:zip => :zip},
          {:country => :country}
        ]},
        {:shipTo  => [
          {:firstName => :ship_to_first_name},
          {:lastName => :ship_to_last_name},
          {:company => :ship_to_company},
          {:address => :ship_to_address},
          {:city => :ship_to_city},
          {:state => :ship_to_state},
          {:zip => :ship_to_zip},
          {:country => :ship_to_country}
        ]}
      ]}
      
      # Describes the order and nesting of fields in the ARB ARBCreateSubscriptionRequest XML.
      CREATE_FIELDS = [
        {:refId => :reference_id},
        SUBSCRIPTION_FIELDS
      ]
      
      # Describes the order and nesting of fields in the ARB ARBUpdateSubscriptionRequest XML.
      UPDATE_FIELDS = [
        {:refId => :reference_id},
        {:subscriptionId => :subscription_id},
        SUBSCRIPTION_FIELDS
      ]
      
      # Describes the order and nesting of fields in the ARB ARBGetSubscriptionStatusRequest XML.
      GET_STATUS_FIELDS = [
        {:refId => :reference_id},
        {:subscriptionId => :subscription_id}
      ]
      
      # Describes the order and nesting of fields in the ARB ARBCancelSubscriptionRequest XML.
      CANCEL_FIELDS = [
        {:refId => :reference_id},
        {:subscriptionId => :subscription_id}
      ]

      # Describes the order and nesting of fields in the ARB ARBGetSubscriptionListRequest XML.
      GET_SUBSCRIPTION_LIST_FIELDS = [
        {:refId => :reference_id},
        {:searchType => :search_type},
        {:sorting => [
           {:orderBy => :order_by},
           {:orderDescending => :order_descending}
          ]
        },
        {:paging => [
           {:limit  => :limit},
           {:offset => :offset}
          ]
        }
      ]
      
      FIELDS = {
        AuthorizeNet::XmlTransaction::Type::ARB_CREATE => CREATE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::ARB_UPDATE => UPDATE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::ARB_GET_STATUS => GET_STATUS_FIELDS,
        AuthorizeNet::XmlTransaction::Type::ARB_CANCEL => CANCEL_FIELDS,
        AuthorizeNet::XmlTransaction::Type::ARB_GET_SUBSCRIPTION_LIST => GET_SUBSCRIPTION_LIST_FIELDS
      }

    end
  end
  
  module CIM
    module Fields
      
      REFID_FIELDS = {:refId => :reference_id}

      VALIDATION_MODE_FIELDS = {:validationMode => :validation_mode}

      CUSTOMER_PROFILE_ID_FIELDS = {:customerProfileId => :customer_profile_id}

      CUSTOMER_PAYMENT_PROFILE_ID_FIELDS = {:customerPaymentProfileId => :customer_payment_profile_id}

      BILL_TO_FIELDS = {:billTo  => [
        {:firstName => :first_name},
        {:lastName => :last_name},
        {:company => :company},
        {:address => :address},
        {:city => :city},
        {:state => :state},
        {:zip => :zip},
        {:country => :country},
        {:phoneNumber => :phone},
        {:faxNumber => :fax}
      ]}
      
      SHIP_TO_FIELDS = {:shipTo  => [
        {:firstName => :ship_to_first_name},
        {:lastName => :ship_to_last_name},
        {:company => :ship_to_company},
        {:address => :ship_to_address},
        {:city => :ship_to_city},
        {:state => :ship_to_state},
        {:zip => :ship_to_zip},
        {:country => :ship_to_country},
        {:phoneNumber => :ship_to_phone},
        {:faxNumber => :ship_to_fax}
      ], :_multivalue => :addresses}
      
      ADDRESS_FIELDS = {:address => [
          {:firstName => :first_name},
          {:lastName => :last_name},
          {:company => :company},
          {:address => :address},
          {:city => :city},
          {:state => :state},
          {:zip => :zip},
          {:country => :country},
          {:phoneNumber => :phone},
          {:faxNumber => :fax}
        ]
      }
      
      PAYMENT_PROFILE_FIELDS = [
        {:customerType => :cust_type},
        BILL_TO_FIELDS,
        {:payment => [
          {:creditCard => [
            {:cardNumber => :card_num},
            {:expirationDate => :exp_date},
            {:cardCode => :card_code}
          ]},
          {:bankAccount => [
            {:accountType => :bank_acct_type},
            {:routingNumber => :bank_aba_code},
            {:accountNumber => :bank_acct_num},
            {:nameOnAccount => :bank_acct_name},
            {:echeckType => :echeck_type},
            {:bankName => :bank_name}
          ]}
        ]}
      ]
      
      PROFILE_FIELDS = {:profile => [
        {:merchantCustomerId => :cust_id},
        {:description => :description},
        {:email => :email},
        {:paymentProfiles => PAYMENT_PROFILE_FIELDS, :_multivalue => :payment_profiles},
        SHIP_TO_FIELDS
      ]}
      
      TRANSACTION_FIELDS = [
        {:amount => :amount},
        {:tax => [
          {:amount => :tax},
          {:name => :tax_name},
          {:description => :tax_description}
        ]},
        {:shipping => [
          {:amount => :freight},
          {:name => :freight_name},
          {:description => :freight_description}
        ]},
        {:duty => [
          {:amount => :duty},
          {:name => :duty_name},
          {:description => :duty_description}
        ]},
        {:lineItems => [
          {:itemId => :line_item_id},
          {:name => :line_item_name},
          {:description => :line_item_description},
          {:quantity => :line_item_quantity},
          {:unitPrice => :line_item_unit_price},
          {:taxable => :line_item_taxable}
        ], :_multivalue => :line_items},
        CUSTOMER_PROFILE_ID_FIELDS,
        CUSTOMER_PAYMENT_PROFILE_ID_FIELDS,
        {:customerShippingAddressId => :customer_address_id},
        {:creditCardNumberMasked => :card_num_masked},
        {:bankRoutingNumberMasked => :bank_aba_code_masked},
        {:bankAccountNumberMasked => :bank_acct_num_masked},
        {:order => [
          {:invoiceNumber => :invoice_num},
          {:description => :description},
          {:purchaseOrderNumber => :po_num}
        ]},
        {:taxExempt => :tax_exempt},
        {:recurringBilling => :recurring_billing},
        {:cardCode => :card_code},
        {:splitTenderId => :split_tender_id},
        {:approvalCode => :auth_code},
        {:transId => :trans_id}
      ]
      
      TRANSACTION_AUTH_FIELDS = [
        {:profileTransAuthOnly => TRANSACTION_FIELDS}
      ]
      
      TRANSACTION_AUTH_CAPTURE_FIELDS = [
        {:profileTransAuthCapture => TRANSACTION_FIELDS}
      ]
      
      TRANSACTION_CAPTURE_FIELDS = [
        {:profileTransCaptureOnly => TRANSACTION_FIELDS}
      ]
      
      TRANSACTION_PRIOR_AUTH_CAPTURE_FIELDS = [
        {:profileTransPriorAuthCapture => TRANSACTION_FIELDS}
      ]
      
      TRANSACTION_REFUND_FIELDS = [
        {:profileTransRefund => TRANSACTION_FIELDS}
      ]
      
      TRANSACTION_VOID_FIELDS = [
        {:profileTransVoid => [
          CUSTOMER_PROFILE_ID_FIELDS,
          CUSTOMER_PAYMENT_PROFILE_ID_FIELDS,
          {:transId => :trans_id}
        ]}
      ]
      
      CREATE_PROFILE_FIELDS = [
        REFID_FIELDS,
        PROFILE_FIELDS,
        VALIDATION_MODE_FIELDS
      ]
      
      CREATE_PAYMENT_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        {:paymentProfile => PAYMENT_PROFILE_FIELDS},
        VALIDATION_MODE_FIELDS
      ]
      
      CREATE_ADDRESS_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        ADDRESS_FIELDS
      ]
      
      CREATE_TRANSACTION_FIELDS = [
        REFID_FIELDS,
        {:transaction => [], :_conditional => :select_transaction_type_fields},
        {:extraOptions => :extra_options}
      ]
      
      DELETE_PROFILE_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS
      ]
      
      DELETE_PAYMENT_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        CUSTOMER_PAYMENT_PROFILE_ID_FIELDS
      ]
      
      DELETE_ADDRESS_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        {:customerAddressId => :customer_address_id}
      ]
      
      GET_PROFILE_IDS_FIELDS = []
      
      GET_PROFILE_FIELDS = [
        CUSTOMER_PROFILE_ID_FIELDS
      ]
      
      GET_PAYMENT_FIELDS = [
        CUSTOMER_PROFILE_ID_FIELDS,
        CUSTOMER_PAYMENT_PROFILE_ID_FIELDS
      ]
      
      GET_ADDRESS_FIELDS = [
        CUSTOMER_PROFILE_ID_FIELDS,
        {:customerAddressId => :customer_address_id}
      ]

      GET_HOSTED_PROFILE_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        { :hostedProfileSettings => [ { :setting => [ { :settingName => :setting_name }, { :settingValue => :setting_value } ], :_multivalue => :hosted_settings } ] }
      ]
      
      UPDATE_PROFILE_FIELDS = [
        REFID_FIELDS,
        {:profile => [
          {:merchantCustomerId => :cust_id},
          {:description => :description},
          {:email => :email},
          CUSTOMER_PROFILE_ID_FIELDS
        ]}
      ]
      
      UPDATE_PAYMENT_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        {:paymentProfile => PAYMENT_PROFILE_FIELDS + [CUSTOMER_PAYMENT_PROFILE_ID_FIELDS]},
        VALIDATION_MODE_FIELDS
      ]
      
      UPDATE_ADDRESS_FIELDS = [
        REFID_FIELDS,
        CUSTOMER_PROFILE_ID_FIELDS,
        {:address => [
          {:firstName => :first_name},
          {:lastName => :last_name},
          {:company => :company},
          {:address => :address},
          {:city => :city},
          {:state => :state},
          {:zip => :zip},
          {:country => :country},
          {:phoneNumber => :phone},
          {:faxNumber => :fax},
          {:customerAddressId => :customer_address_id}
        ]}
      ]
      
      UPDATE_SPLIT_FIELDS = [
        {:splitTenderId => :split_tender_id},
        {:splitTenderStatus => :split_tender_status}
      ]
      
      VALIDATE_PAYMENT_FIELDS = [
        CUSTOMER_PROFILE_ID_FIELDS,
        CUSTOMER_PAYMENT_PROFILE_ID_FIELDS,
        {:customerShippingAddressId => :customer_address_id},
        {:cardCode => :card_code},
        VALIDATION_MODE_FIELDS
      ]
      
      FIELDS = {
        AuthorizeNet::XmlTransaction::Type::CIM_CREATE_PROFILE => CREATE_PROFILE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_CREATE_PAYMENT => CREATE_PAYMENT_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_CREATE_ADDRESS => CREATE_ADDRESS_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_CREATE_TRANSACTION => CREATE_TRANSACTION_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_DELETE_PROFILE => DELETE_PROFILE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_DELETE_PAYMENT => DELETE_PAYMENT_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_DELETE_ADDRESS => DELETE_ADDRESS_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_GET_PROFILE_IDS => GET_PROFILE_IDS_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_GET_PROFILE => GET_PROFILE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_GET_PAYMENT => GET_PAYMENT_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_GET_ADDRESS => GET_ADDRESS_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_GET_HOSTED_PROFILE => GET_HOSTED_PROFILE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_UPDATE_PROFILE => UPDATE_PROFILE_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_UPDATE_PAYMENT => UPDATE_PAYMENT_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_UPDATE_ADDRESS => UPDATE_ADDRESS_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_UPDATE_SPLIT => UPDATE_SPLIT_FIELDS,
        AuthorizeNet::XmlTransaction::Type::CIM_VALIDATE_PAYMENT => VALIDATE_PAYMENT_FIELDS
      }
      
      ADDRESS_ENTITY_DESCRIPTION = EntityDescription.new(
        [
          {:firstName => :first_name},
          {:lastName => :last_name},
          {:company => :company},
          {:address => :street_address},
          {:city => :city},
          {:state => :state},
          {:zip => :zip},
          {:country => :country},
          {:phoneNumber => :phone},
          {:faxNumber => :fax}
        ],
        AuthorizeNet::Address
      )
      
      CREDIT_CARD_ENTITY_DESCRIPTION = EntityDescription.new(
        [
          {:cardNumber => :card_num},
          {:expirationDate => :exp_date},
          {:cardCode => :card_code},
          {:cardType => :card_type}
        ],
        AuthorizeNet::CreditCard,
        [:card_num, :exp_date]
      )
      
      ECHECK_ENTITY_DESCRIPTION = EntityDescription.new(
        [
          {:accountType => :account_type},
          {:routingNumber => :routing_number},
          {:accountNumber => :account_number},
          {:nameOnAccount => :account_holder_name},
          {:echeckType => :echeck_type},
          {:bankName => :bank_name}
        ],
        AuthorizeNet::ECheck,
        [:routing_number, :account_number, :bank_name, :account_holder_name]
      )
      
      PAYMENT_PROFILE_ENTITY_DESCRIPTION = EntityDescription.new(
        [
          CUSTOMER_PAYMENT_PROFILE_ID_FIELDS,
          {:customerType => :cust_type},
          {:billTo => ADDRESS_ENTITY_DESCRIPTION, :_value => :billing_address},
          {:payment => [
            {:creditCard => CREDIT_CARD_ENTITY_DESCRIPTION, :_value => :payment_method},
            {:bankAccount => ECHECK_ENTITY_DESCRIPTION, :_value => :payment_method}
          ]}
        ],
        AuthorizeNet::CIM::PaymentProfile
      )
      
      PROFILE_ENTITY_DESCRIPTION = EntityDescription.new(
        [
          {:merchantCustomerId => :id},
          {:description => :description},
          {:email => :email},
          CUSTOMER_PROFILE_ID_FIELDS,
          {:paymentProfiles => PAYMENT_PROFILE_ENTITY_DESCRIPTION, :_multivalue => :payment_profiles},
          {:shipTo => ADDRESS_ENTITY_DESCRIPTION, :_multivalue => :addresses}
        ],
        AuthorizeNet::CIM::CustomerProfile
      )
    end
  end
  
  module Reporting
    module Fields
      
      GET_BATCH_LIST = [
        {:includeStatistics => :include_statistics},
        {:firstSettlementDate => :first_settlement_date},
        {:lastSettlementDate => :last_settlement_date}
      ]
      
      GET_TRANSACTION_LIST = [
        {:batchId => :batch_id}
      ]
      
      GET_UNSETTLED_TRANSACTION_LIST = [
      ]
      
      GET_TRANSACTION_DETAILS = [
        {:transId => :transaction_id}
      ]
      
      BATCH_STATISTICS_ENTITY_DESCRIPTION = EntityDescription.new([
          {:accountType => :account_type},
          {:chargeAmount => :charge_amount, :_converter => :value_to_decimal},
          {:chargeCount => :charge_count, :_converter => :value_to_integer},
          {:refundAmount => :refund_amount, :_converter => :value_to_decimal},
          {:refundCount => :refund_count, :_converter => :value_to_integer},
          {:voidCount => :void_count, :_converter => :value_to_integer},
          {:declineCount => :decline_count, :_converter => :value_to_integer},
          {:errorCount => :error_count, :_converter => :value_to_integer},
          {:returnedItemAmount  => :returned_item_amount, :_converter => :value_to_decimal},
          {:returnedItemCount  => :returned_item_count, :_converter => :value_to_integer},
          {:chargebackAmount => :chargeback_amount, :_converter => :value_to_decimal},
          {:chargebackCount => :chargeback_count, :_converter => :value_to_integer},
          {:correctionNoticeCount => :correction_notice_count, :_converter => :value_to_integer},
          {:chargeChargeBackAmount => :charge_chargeback_amount, :_converter => :value_to_decimal},
          {:chargeChargeBackCount => :charge_chargeback_count, :_converter => :value_to_integer},
          {:refundChargeBackAmount => :refund_chargeback_amount, :_converter => :value_to_decimal},
          {:refundChargeBackCount  => :refund_chargeback_count, :_converter => :value_to_integer},
          {:chargeReturnedItemsAmount => :charge_returned_items_amount, :_converter => :value_to_decimal},
          {:chargeReturnedItemsCount => :charge_returned_items_count, :_converter => :value_to_integer},
          {:refundReturnedItemsAmount => :refund_returned_items_amount, :_converter => :value_to_decimal},
          {:refundReturnedItemsCount => :refund_returned_items_count, :_converter => :value_to_integer}
        ],
        AuthorizeNet::Reporting::BatchStatistics
      )
      
      BATCH_ENTITY_DESCRIPTION = EntityDescription.new([
          {:batchId => :id},
          {:settlementTimeUTC => :settled_at, :_converter => :value_to_datetime},
          {:settlementState => :state},
          {:paymentMethod => :payment_method},
          {:statistics => [{:statistic => BATCH_STATISTICS_ENTITY_DESCRIPTION, :_multivalue => :statistics}]}
        ],
        AuthorizeNet::Reporting::Batch
      )
      
      FDSFILTER_ENTITY_DESCRIPTION = EntityDescription.new([
        {:name => :name},
        {:action => :action}
        ],
        AuthorizeNet::Reporting::FDSFilter
      )
      
      CUSTOMER_ENTITY_DESCRIPTION = EntityDescription.new([
          {:id => :id},
          {:email => :email}
        ],
        AuthorizeNet::CIM::CustomerProfile
      )
      
      ORDER_ENTITY_DESCRIPTION = EntityDescription.new([
          {:invoice_number => :invoice_num},
          {:description => :description},
          {:purchaseOrderNumber => :po_num}
        ],
        AuthorizeNet::Order
      )
      
      LINE_ITEM_ENTITY_DESCRIPTION = EntityDescription.new([
          {:itemId => :id},
          {:name => :name},
          {:description => :description},
          {:quantity => :quantity, :_convert => :value_to_integer},
          {:unityPrice => :price, :_convert => :value_to_decimal},
          {:taxable => :taxable, :_convert => :value_to_boolean}
        ],
        AuthorizeNet::LineItem
      )

      attr_accessor :id, :date_utc, :date_local, :code, :description
      RETURNED_ITEM_ENTITY_DESCRIPTION = EntityDescription.new([
             {:id => :id},
             {:dateUTC => :date_utc},
             {:dateLocal => :date_local},
             {:code => :code},
             {:description => :description}
         ],
         AuthorizeNet::Reporting::ReturnedItem
      )

      
      TRANSACTION_DETAILS_ENTITY_DESCRIPTION = EntityDescription.new([
          {:transId => :id},
          {:refTransId => :reference_id},
          {:splitTenderId => :split_tender_id},
          {:transactionType => :type},
          {:responseCode => :response_code},
          {:responseReasonCode => :response_reason_code},
          {:authCode => :auth_code},
          {:AVSResponse => :avs_response},
          {:cardCodeResponse => :card_code_response},
          {:CAVVResponse => :cavv_response},
          {:FDSFilterAction => :fds_filter_action},
          {:FDSFilters => [{:FDSFilter => FDSFILTER_ENTITY_DESCRIPTION, :_multivalue => :fds_filters}]},
          {:batch => BATCH_ENTITY_DESCRIPTION, :_value => :batch},
          {:responseReasonDescription => :response_reason_description},
          {:submitTimeUTC => :submitted_at, :_converter => :value_to_datetime},
          {:transactionStatus => :status},
          {:accountType => :account_type},
          {:accountNumber => :account_number},
          {:order => ORDER_ENTITY_DESCRIPTION, :_value => :order},
          {:requestedAmount => :requested_amount, :_converter => :value_to_decimal},
          {:authAmount => :auth_amount, :_converter => :value_to_decimal},
          {:settleAmount => :settle_amount, :_converter => :value_to_decimal},
          {:prepaidBalanceRemaining => :prepaid_balance_remaining, :_converter => :value_to_decimal},
          {:payment => [
            {:creditCard => AuthorizeNet::CIM::Fields::CREDIT_CARD_ENTITY_DESCRIPTION, :_value => :payment_method},
            {:bankAccount => AuthorizeNet::CIM::Fields::ECHECK_ENTITY_DESCRIPTION, :_value => :payment_method}
          ]},
          {:customer => CUSTOMER_ENTITY_DESCRIPTION, :_value => :customer},
          {:billTo => AuthorizeNet::CIM::Fields::ADDRESS_ENTITY_DESCRIPTION, :_value => :bill_to},
          {:shipTo => AuthorizeNet::CIM::Fields::ADDRESS_ENTITY_DESCRIPTION, :_value => :ship_to},
          {:recurringBilling => :recurring_billing, :_convert => :value_to_boolean},
          {:hasReturnedItems => :returns, :_convert => :value_to_boolean}
        ],
        AuthorizeNet::Reporting::TransactionDetails
      )
      
      FIELDS = {
        AuthorizeNet::XmlTransaction::Type::REPORT_GET_BATCH_LIST => GET_BATCH_LIST,
        AuthorizeNet::XmlTransaction::Type::REPORT_GET_TRANSACTION_LIST => GET_TRANSACTION_LIST,
        AuthorizeNet::XmlTransaction::Type::REPORT_GET_UNSETTLED_TRANSACTION_LIST => GET_UNSETTLED_TRANSACTION_LIST,
        AuthorizeNet::XmlTransaction::Type::REPORT_GET_TRANSACTION_DETAILS => GET_TRANSACTION_DETAILS
      }
    end
  end
end
