module AuthorizeNet::CIM

  # The CIM transaction class.
  class Transaction < AuthorizeNet::XmlTransaction
    
    include AuthorizeNet::CIM::Fields
    
    # The class to wrap our response in.
    @response_class = AuthorizeNet::CIM::Response
    
    # The default options for the constructor.
    @@option_defaults = {
      :gateway => :production,
      :verify_ssl => false,
      :reference_id => nil
    }
    
    # Constructs a CIM transaction. You can use the new CIM transaction object
    # to issue a request to the payment gateway and parse the response into a new
    # AuthorizeNet::CIM::Response object.
    # 
    # +api_login_id+:: Your API login ID, as a string.
    # +api_transaction_key+:: Your API transaction key, as a string.
    # +options+:: A hash of options. See below for values.
    # 
    # Options
    # +gateway+:: The gateway to submit the transaction to. Can be a URL string, an AuthorizeNet::CIM::Transaction::Gateway constant, or one of the convenience symbols :sandbox, :test, :production, or :live (:test is an alias for :sandbox, and :live is an alias for :production). 
    # +verify_ssl+:: A boolean indicating if the SSL certificate of the +gateway+ should be verified. Defaults to false.
    # +reference_id+:: A string that can be used to identify a particular transaction with its response. Will be echo'd in the response, only if it was provided in the transaction. Defaults to nil.
    #
    def initialize(api_login_id, api_transaction_key, options = {})
      super
      @delim_char = ','
      @encap_char = nil
      @custom_fields = {}
    end
    
    # The default options for create_profile.
    @@create_profile_option_defaults = {
      :validation_mode => :none
    }
    
    # The default options for create_payment_profile.
    @@create_payment_profile_option_defaults = {
      :validation_mode => :none
    }
    
    # The default options for update_payment_profile.
    @@update_payment_profile_option_defaults = {
      :validation_mode => :none
    }
    
    # The default options for create_transaction and the various type specific create transaction methods.
    @@create_transaction_option_defaults = {
      :address_id => nil,
      :split_tender_id => nil,
      :aim_options => nil,
      :custom_fields => nil
    }
    
    # The default options for validate_payment_profile.
    @@validate_payment_profile_option_defaults = {
      :address_id => nil,
      :card_code => nil,
      :validation_mode => :testMode
    }
    
    # A list of keys that should be stored if passed as aim_options.
    @@aim_response_options = [:delim_char, :encap_char]
    
    # Sets up and submits a createCustomerProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have a profile_id if the request was successful. If any PaymentProfiles or Addresses
    # were included, you can find their IDs in the response objects payment_profile_ids and address_ids methods.
    #
    # +profile+:: An AuthorizeNet::CIM::CustomerProfile object describing the profile to create.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +validation_mode+:: Set to :testMode, :liveMode or :none (the default) to indicate what sort of PaymentProfile validation to do (assuming a PaymentProfile is included with the CustomerProfile)
    # 
    # Typical usage:
    # 
    #   profile = AuthorizeNet::CIM::CustomerProfile.new(
    #     :email => 'test@example.com',
    #     :id => 'userassignedid'
    #   )
    #   response = transaction.create_profile(profile)
    #   puts response.profile_id if response.success?
    # 
    def create_profile(profile, options = {})
      options = @@create_profile_option_defaults.merge(options)
      @type = Type::CIM_CREATE_PROFILE
      @fields.merge!(profile.to_hash)
      set_fields(:validation_mode => options[:validation_mode])
      make_request
    end
    
    # This request enables you to create a CIM profile, payment profile,
    # and shipping profile from an existing successful transaction. 
    # NOTE: Tokenized transactions (e.g. Apple Pay) should not be used to 
    # create payment profiles.
    # 
    # Typical usage:
    # 
    #   @transaction_id = 123456789
    #   response = transaction.create_profile_from_transaction(@transaction_id)
    #   puts response.profile_id if response.success?
    #   puts response.payment_profile_ids[0] if response.success?
    #  
    def create_profile_from_transaction(transaction_id)
      @type = Type::CIM_CREATE_PROFILE_FROM_TRANSACTION
      handle_transaction_id(transaction_id)
      make_request
    end
    
    # Sets up and submits a getCustomerProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have the CustomerProfile object requested available via its profile method if
    # the request was successful.
    # 
    #
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile you want to retrieve, or a CustomerProfile object with the ID populated.
    # Typical usage:
    # 
    #   response = transaction.get_profile('123456')
    #   profile = response.profile if response.success?
    #
    def get_profile(profile_id)
      @type = Type::CIM_GET_PROFILE
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a updateCustomerProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. Note that
    # any PaymentProfiles will NOT be updated using this method. This is a limitation of the CIM API. See
    # update_payment_profile if you need to update a PaymentProfile.
    # 
    #
    # +profile+:: An AuthorizeNet::CIM::CustomerProfile object describing the profile to update. It must contain the customer_profile_id of the record to update.
    # Typical usage:
    # 
    #   profile.fax = '5555551234'
    #   response = transaction.update_profile(profile)
    #   puts response.success?
    #
    def update_profile(profile)
      @type = Type::CIM_UPDATE_PROFILE
      @fields.merge!(profile.to_hash)
      make_request
    end
    
    # Sets up and submits a deleteCustomerProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object.
    # 
    #
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile you want to delete, or a CustomerProfile object with the ID populated.
    # Typical usage:
    # 
    #   response = transaction.delete_profile('123456')
    #   puts response.success?
    #
    def delete_profile(profile_id)
      @type = Type::CIM_DELETE_PROFILE
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a createCustomerPaymentProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have a payment_profile_id if the request was successful.
    #
    # +profile+:: An AuthorizeNet::CIM::PaymentProfile object describing the profile to create.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who will own the PaymentProfile, or a CustomerProfile object with the ID populated.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +validation_mode+:: Set to :testMode, :liveMode or :none (the default) to indicate what sort of PaymentProfile validation to do (assuming a PaymentProfile is included with the CustomerProfile)
    # 
    # Typical usage:
    # 
    #   credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '0120')
    #   payment_profile = AuthorizeNet::CIM::PaymentProfile.new(:payment_method => credit_card)
    #   response = transaction.create_payment_profile(payment_profile, '123456')
    #   puts response.payment_profile_id if response.success?
    #
    def create_payment_profile(payment_profile, profile_id, options = {})
      options = @@create_payment_profile_option_defaults.merge(options)
      @type = Type::CIM_CREATE_PAYMENT
      @fields.merge!(payment_profile.to_hash)
      set_fields(:validation_mode => options[:validation_mode])
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a getCustomerPaymentProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have the PaymentProfile object requested available via its payment_profile method if
    # the request was successful.
    # 
    # +payment_profile_id+:: Takes either a String containing the ID of the PaymentProfile you want to retrieve, or a PaymentProfile object with the ID populated.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this PaymentProfile, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   response = transaction.get_payment_profile('654321', '123456')
    #   payment_profile = response.payment_profile if response.success?
    #
    def get_payment_profile(payment_profile_id, profile_id)
      @type = Type::CIM_GET_PAYMENT
      handle_payment_profile_id(payment_profile_id)
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a updateCustomerPaymentProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object.
    # 
    #
    # +payment_profile+:: An AuthorizeNet::CIM::PaymentProfile object describing the profile to update.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this PaymentProfile, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   payment_profile.cust_type = :business
    #   response = transaction.update_payment_profile(payment_profile, '123456')
    #   puts response.success?
    # 
    # Options:
    # +validation_mode+:: Set to :testMode, :liveMode or :none (the default) to indicate what sort of PaymentProfile validation to do.
    #
    def update_payment_profile(payment_profile, profile_id, options = {})
      options = @@create_payment_profile_option_defaults.merge(options)
      @type = Type::CIM_UPDATE_PAYMENT
      @fields.merge!(payment_profile.to_hash)
      set_fields(:validation_mode => options[:validation_mode])
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a deleteCustomerPaymentProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object.
    # 
    #
    # +payment_profile_id+:: Takes either a String containing the ID of the PaymentProfile you want to retrieve, or a PaymentProfile object with the ID populated.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this PaymentProfile, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   response = transaction.delete_profile('123456')
    #   puts response.success?
    #
    def delete_payment_profile(payment_profile_id, profile_id)
      @type = Type::CIM_DELETE_PAYMENT
      handle_payment_profile_id(payment_profile_id)
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a validateCustomerPaymentProfileRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The results
    # of the validation can be obtained via the direct_response method of the response object.
    # 
    #
    # +payment_profile_id+::  Takes either a String containing the ID of the PaymentProfile you want to validate, or a PaymentProfile object with the ID populated.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this PaymentProfile, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   response = transaction.validate_payment_profile('654321', '123456')
    #   puts response.direct_response.success? if response.success?
    # 
    # Options:
    # +validation_mode+:: Set to :testMode (the default) or :liveMode to indicate what sort of PaymentProfile validation to do.
    # +address_id+:: Set a shipping Address to be part of the validation transaction.
    # +card_code+:: Set a CCV code if one is needed for validation. Defaults to nil.
    # 
    def validate_payment_profile(payment_profile_id, profile_id, options = {})
      @type = Type::CIM_VALIDATE_PAYMENT
      options = @@validate_payment_profile_option_defaults.merge(options)
      handle_payment_profile_id(payment_profile_id)
      handle_profile_id(profile_id)
      handle_address_id(options[:address_id]) unless options[:address_id].nil?
      set_fields(:validation_mode => options[:validation_mode])
      set_fields(:card_code => options[:card_code]) unless options[:card_code].nil?
      make_request
    end
    
    # Sets up and submits a createCustomerShippingAddressRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have a address_id if the request was successful.
    #
    # +address+:: An AuthorizeNet::Address object describing the profile to create.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who will own this Address, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   address = AuthorizeNet::Address.new(:first_name => 'Jane', :last_name => 'Doe', :address => '123 Fake St', :city => 'Raccoon Junction', :state => 'WY', :zip => '99999')
    #   response = transaction.create_address(address, '123456')
    #   puts response.address_id if response.success?
    #
    def create_address(address, profile_id)
      @type = Type::CIM_CREATE_ADDRESS
      @fields.merge!(address.to_hash)
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a getCustomerShippingAddressRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have the Address object requested available via its address method if
    # the request was successful.
    # 
    #
    # +address_id+:: Takes either a String containing the ID of the Address you want to retrieve, or an Address object with the ID populated.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this Address, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   response = transaction.get_address('654321', '123456')
    #   address = response.address if response.success?
    #
    def get_address(address_id, profile_id)
      @type = Type::CIM_GET_ADDRESS
      handle_address_id(address_id)
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a updateCustomerShippingAddressRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object.
    # 
    #
    # +address+:: An Address object describing the address to update.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this Address, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   address.city = 'Somewhere Else'
    #   response = transaction.update_address(address, '123456')
    #   puts response.success?
    #
    def update_address(address, profile_id)
      @type = Type::CIM_UPDATE_ADDRESS
      @fields.merge!(address.to_hash)
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a deleteCustomerShippingAddressRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object.
    # 
    #
    # +address_id+:: Takes either a String containing the ID of the Address you want to delete, or an Address object with the ID populated.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns this Address, or a CustomerProfile object with the ID populated.
    # 
    # Typical usage:
    # 
    #   response = transaction.delete_address('654321', '123456')
    #   puts response.success?
    #
    def delete_address(address_id, profile_id)
      @type = Type::CIM_DELETE_ADDRESS
      handle_address_id(address_id)
      handle_profile_id(profile_id)
      make_request
    end
    
    # Sets up and submits a createCustomerProfileTransactionRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. It is recommend
    # to use the connivence methods for each type of payment transaction rather than this method.
    # 
    # +type+:: The type of payment transaction to run. Can be :auth_capture, :auth_only, :prior_auth_capture, :void, or :refund.
    # +amount+:: The amount of the transaction. This is required for every transaction type except :void.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns the PaymentProfile to be charged, or a CustomerProfile object with the ID populated.
    # +payment_profile_id+:: Takes either a String containing the ID of the PaymentProfile you want to charge, or a PaymentProfile object with the ID populated.
    # +order+:: An Order object describing the order that this payment transaction is for. Pass nil for no order.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +address_id+:: Takes either a String containing the ID of the an Address, or an Address object with the ID populated. Used as the shipping address for the payment transaction. Defaults to nil.
    # +split_tender_id+:: A split tender transaction ID as a string. If the transaction is to be part of a split tender batch, this must be included. Defaults to nil.
    # +aim_options+:: A hash of AIM options to be included with the payment transaction. Since the payment transactions in CIM are just encapsulated AIM transactions, any field used by AIM can be set here. Defaults to nil.
    # +custom_fields+:: A hash of custom fields to pass along with the payment transaction. These fields will be stored with the AIM transaction generated by the CIM transaction. Defaults to nil.
    # 
    # Typical usage:
    # 
    #   response = transaction.create_transaction(:auth_capture, 10.00, '123456', '654321', nil)
    #   if response.success?
    #     puts response.direct_response if direct_response.success?
    # 
    # 
    def create_transaction(type, amount, profile_id, payment_profile_id, order, options = {})
      @type = Type::CIM_CREATE_TRANSACTION
      options = @@create_transaction_option_defaults.merge(options)
      handle_profile_id(profile_id)
      handle_payment_profile_id(payment_profile_id)
      handle_address_id(options[:address_id]) unless options[:address_id].nil?
      set_fields(:split_tender_id => options[:split_tender_id])
      @transaction_type = type
      @fields.merge!(order.to_hash) unless order.nil?
      set_fields(:amount => amount)
      handle_aim_options(options[:aim_options])
      handle_custom_fields(options[:custom_fields])
      make_request
    end
    
    
    # Sets up and submits an AUTHORIZE_AND_CAPTURE transaction using stored payment information. If this
    # transaction has already been run, this method will return nil. Otherwise it will return an
    # AuthorizeNet::CIM::Response object.
    # 
    # +amount+:: The amount of the transaction.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns the PaymentProfile to be charged, or a CustomerProfile object with the ID populated.
    # +payment_profile_id+:: Takes either a String containing the ID of the PaymentProfile you want to charge, or a PaymentProfile object with the ID populated.
    # +order+:: An Order object describing the order that this payment transaction is for. Pass nil for no order.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +address_id+:: Takes either a String containing the ID of the an Address, or an Address object with the ID populated. Used as the shipping address for the payment transaction. Defaults to nil.
    # +split_tender_id+:: A split tender transaction ID as a string. If the transaction is to be part of a split tender batch, this must be included. Defaults to nil.
    # +aim_options+:: A hash of AIM options to be included with the payment transaction. Since the payment transactions in CIM are just encapsulated AIM transactions, any field used by AIM can be set here. Defaults to nil.
    # +custom_fields+:: A hash of custom fields to pass along with the payment transaction. These fields will be stored with the AIM transaction generated by the CIM transaction. Defaults to nil.
    #
    # Typical usage:
    # 
    #   response = transaction.create_transaction_auth_capture(10.00, '123456', '654321', nil)
    #   if response.success?
    #     puts response.direct_response if direct_response.success?
    #
    def create_transaction_auth_capture(amount, profile_id, payment_profile_id, order = nil, options = {})
      create_transaction(:auth_capture, amount, profile_id, payment_profile_id, order, options)
    end
    
    # Sets up and submits an AUTH_ONLY transaction using stored payment information. If this
    # transaction has already been run, this method will return nil. Otherwise it will return an
    # AuthorizeNet::CIM::Response object.
    # 
    # +amount+:: The amount of the transaction.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns the PaymentProfile to be charged, or a CustomerProfile object with the ID populated.
    # +payment_profile_id+:: Takes either a String containing the ID of the PaymentProfile you want to charge, or a PaymentProfile object with the ID populated.
    # +order+:: An Order object describing the order that this payment transaction is for. Pass nil for no order.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +address_id+:: Takes either a String containing the ID of the an Address, or an Address object with the ID populated. Used as the shipping address for the payment transaction. Defaults to nil.
    # +split_tender_id+:: A split tender transaction ID as a string. If the transaction is to be part of a split tender batch, this must be included. Defaults to nil.
    # +aim_options+:: A hash of AIM options to be included with the payment transaction. Since the payment transactions in CIM are just encapsulated AIM transactions, any field used by AIM can be set here. Defaults to nil.
    # +custom_fields+:: A hash of custom fields to pass along with the payment transaction. These fields will be stored with the AIM transaction generated by the CIM transaction. Defaults to nil.
    #
    # Typical usage:
    # 
    #   response = transaction.create_transaction_auth_only(10.00, '123456', '654321', nil)
    #   if response.success?
    #     puts response.direct_response if direct_response.success?
    #
    def create_transaction_auth_only(amount, profile_id, payment_profile_id, order = nil, options = {})
      create_transaction(:auth_only, amount, profile_id, payment_profile_id, order, options)
    end
    
    # Sets up and submits a PRIOR_AUTHORIZATION_AND_CAPTURE transaction using stored payment information. If this
    # transaction has already been run, this method will return nil. Otherwise it will return an
    # AuthorizeNet::CIM::Response object.
    # 
    # +transaction_id+:: A string containing a transaction ID that was generated via an AUTH_ONLY transaction.
    # +amount+:: The amount to capture. Must be <= the amount authorized via the AUTH_ONLY transaction.
    # +order+:: An Order object describing the order that this payment transaction is for. Pass nil for no order.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +aim_options+:: A hash of AIM options to be included with the payment transaction. Since the payment transactions in CIM are just encapsulated AIM transactions, any field used by AIM can be set here. Defaults to nil.
    # +custom_fields+:: A hash of custom fields to pass along with the payment transaction. These fields will be stored with the AIM transaction generated by the CIM transaction. Defaults to nil.
    #
    # Typical usage:
    # 
    #   response = transaction.create_transaction_prior_auth_capture('111222', 10.00)
    #   if response.success?
    #     puts response.direct_response if direct_response.success?
    #
    def create_transaction_prior_auth_capture(transaction_id, amount, order = nil, options = {})
      handle_transaction_id(transaction_id)
      create_transaction(:prior_auth_capture, amount, nil, nil, order, options)
    end
    
    # Sets up and submits a VOID transaction using stored payment information. If this
    # transaction has already been run, this method will return nil. Otherwise it will return an
    # AuthorizeNet::CIM::Response object.
    # 
    # +transaction_id+:: A string containing a transaction ID to void.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +aim_options+:: A hash of AIM options to be included with the payment transaction. Since the payment transactions in CIM are just encapsulated AIM transactions, any field used by AIM can be set here. Defaults to nil.
    # +custom_fields+:: A hash of custom fields to pass along with the payment transaction. These fields will be stored with the AIM transaction generated by the CIM transaction. Defaults to nil.
    #
    # Typical usage:
    # 
    #   response = transaction.create_transaction_void('111222')
    #   if response.success?
    #     puts response.direct_response if direct_response.success?
    #
    def create_transaction_void(transaction_id, options = {})
      handle_transaction_id(transaction_id)
      create_transaction(:void, nil, nil, nil, nil, options)
    end
    
    # Sets up and submits a REFUND transaction using stored payment information. If this
    # transaction has already been run, this method will return nil. Otherwise it will return an
    # AuthorizeNet::CIM::Response object.
    # 
    # +transaction_id+:: A string containing a transaction ID to refund. Pass nil for an unlinked refund.
    # +amount+:: The amount to refund.
    # +profile_id+:: Takes either a String containing the ID of the CustomerProfile who owns the PaymentProfile to be credited, or a CustomerProfile object with the ID populated. Pass nil for an unlinked refund.
    # +payment_profile_id+:: Takes either a String containing the ID of the PaymentProfile you want to credit, or a PaymentProfile object with the ID populated. Pass nil for an unlinked refund.
    # +order+:: An Order object describing the order that is being refunded. Pass nil for no order.
    # +options+:: An optional hash of options.
    # 
    # Options:
    # +aim_options+:: A hash of AIM options to be included with the payment transaction. Since the payment transactions in CIM are just encapsulated AIM transactions, any field used by AIM can be set here. Defaults to nil.
    # +custom_fields+:: A hash of custom fields to pass along with the payment transaction. These fields will be stored with the AIM transaction generated by the CIM transaction. Defaults to nil.
    #
    # Typical usage:
    # 
    #   response = transaction.create_transaction_refund('111222', 10.00, '123456', '654321')
    #   if response.success?
    #     puts response.direct_response if direct_response.success?
    #
    def create_transaction_refund(transaction_id, amount, profile_id, payment_profile_id, order = nil, options = {})
      handle_transaction_id(transaction_id)
      create_transaction(:refund, amount, profile_id, payment_profile_id, order, options)
    end
    
    # Sets up and submits a updateSplitTenderGroupRequest transaction. Use this to end or void a split
    # tender batch. If this transaction has already been run, this method will return nil. Otherwise 
    # it will return an AuthorizeNet::CIM::Response object.
    # 
    # +split_tender_id+:: The split tender batch ID you want to change the status of.
    # +status+:: The new status to set for the batch. Options are :voided or :completed.
    # 
    # Typical usage:
    # 
    #   response = transaction.update_split_tender('1111111', :voided)
    #   puts response if response.success?
    #
    def update_split_tender(split_tender_id, status)
      @type = Type::CIM_UPDATE_SPLIT
      set_fields(:split_tender_id => split_tender_id, :split_tender_status => status.to_s)
      make_request
    end
    
    # Sets up and submits a getCustomerProfileIdsRequest transaction. If this transaction has already been
    # run, this method will return nil. Otherwise it will return an AuthorizeNet::CIM::Response object. The
    # response object will have a list of all CustomerProfile IDs available via its profile_ids method on success.
    # 
    # Typical usage:
    # 
    #   response = transaction.get_profile_ids()
    #   puts response.profile_ids if response.success?
    # 
    def get_profile_ids()
      @type = Type::CIM_GET_PROFILE_IDS
      make_request
    end
    
    # :stopdoc:
    # Duck-type as an AIM transaction so we can build AIM responses easily
    
    # No encapsulation_character.
    def encapsulation_character
      @encap_char
    end
    
    # Comma delimited.
    def delimiter
      @delim_char
    end
    
    # Custom fields accessor.
    def custom_fields
      @custom_fields
    end
    
    # Always version 3.1.
    def version
      3.1
    end
    
    # Always nil.
    def cp_version
      nil
    end
    # :startdoc:
    
    #:enddoc:
    protected
    
    # Handles profile id type massaging.
    def handle_profile_id(id)
      case id
      when CustomerProfile
        set_fields(:customer_profile_id => id.customer_profile_id.to_s)
      when nil
        nil
      else
        set_fields(:customer_profile_id => id.to_s)
      end
    end
    
    # Handles payment profile id type massaging.
    def handle_payment_profile_id(id)
      case id
      when PaymentProfile
        set_fields(:customer_payment_profile_id => id.customer_payment_profile_id.to_s)
      when nil
        nil
      else
        set_fields(:customer_payment_profile_id => id.to_s)
      end
    end
    
    # Handles address id type massaging.
    def handle_address_id(id)
      case id
      when AuthorizeNet::Address
        set_fields(:customer_address_id => id.customer_address_id.to_s)
      when nil
        nil
      else
        set_fields(:customer_address_id => id.to_s)
      end
    end
    
    # Handles tranasction id type massaging.
    def handle_transaction_id(id)
      case id
      when AuthorizeNet::AIM::Response
        set_fields(:trans_id => id.transaction_id.to_s)
      else
        set_fields(:trans_id => id.to_s)
      end
    end
    
    # Handles packing up aim options.
    def handle_aim_options(options)
      encoded_options = []
      case options
      when Hash
        options.each_pair do |k,v|
          if @@aim_response_options.include?(k)
            self.instance_variable_set(('@' + k.to_s).to_sym, v)
          end
        end
      when nil
        return
      else
        return handle_aim_options(options.to_hash)
      end
      
      @fields[:extra_options] ||= {}
      @fields[:extra_options].merge!(options)
    end
    
    # Handles packing up custom fields.
    def handle_custom_fields(options)
      encoded_options = []
      case options
      when Hash
        @custom_fields.merge!(options)
      when nil
        return
      else
        return handle_custom_fields(options.to_hash)
      end
    end
    
    # Callback for creating the right node structure for a given transaction type. `node` is ignored for now.
    def select_transaction_type_fields(node)
      case @transaction_type
      when :auth_only
        return TRANSACTION_AUTH_FIELDS
      when :auth_capture
        return TRANSACTION_AUTH_CAPTURE_FIELDS
      when :void
        return TRANSACTION_VOID_FIELDS
      when :refund
        return TRANSACTION_REFUND_FIELDS
      when :capture_only
        return TRASNACTION_CAPTURE_FIELDS
      when :prior_auth_capture
        return TRANSACTION_PRIOR_AUTH_CAPTURE_FIELDS
      end
    end
    
  end
end