module AuthorizeNet
  # Defines constants for each payment method type.
  module PaymentMethodType
    ECHECK = 'ECHECK'.freeze
  end

  # Models an eCheck.
  class ECheck
    PAYMENT_METHOD_CODE = AuthorizeNet::PaymentMethodType::ECHECK

    # Defines constants for each bank account type.
    module AccountType
      CHECKING = 'CHECKING'.freeze
      SAVINGS = 'SAVINGS'.freeze
      BUSINESS_CHECKING = 'BUSINESSCHECKING'.freeze
    end

    # Defines constants for each check type.
    module CheckType
      ACCOUNTS_RECEIVABLE_CONVERSION = 'ARC'.freeze
      BACK_OFFICE_CONVERSION = 'BOC'.freeze
      CASH_CONCENTRATION_DISBURSEMENT = 'CCD'.freeze
      PREARRANGED_PAYMENT_DEPOSIT = 'PPD'.freeze
      TELEPHONE_INITIATED = 'TEL'.freeze
      INTERNET_INITIATED = 'WEB'.freeze
    end

    # The option defaults for the constructor.
    @@option_defaults = {
      echeck_type: CheckType::INTERNET_INITIATED,
      check_number: nil,
      account_type: AccountType::CHECKING
    }

    attr_accessor :routing_number, :account_number, :bank_name, :account_holder_name, :echeck_type, :check_number, :account_type

    # Constructs a new eCheck object.
    #
    # +routing_number+:: The bank routing number as a string.
    # +account_number+:: The bank account number as a string.
    # +bank_name+:: The legal name of the bank. This should match the name associated with the +routing_number+.
    # +account_holder_name+:: The full name on the bank account represented by +account_number+.
    # +options+:: A hash of options. Accepts +echeck_type+ (the type of check, can usually be ignored), +check_number+ (the number on the check, only needed for some check types), and +account_type+ (the type of bank account the check draws from). All values should be passed as strings.
    #
    def initialize(routing_number, account_number, bank_name, account_holder_name, options = {})
      @routing_number = routing_number
      @account_number = account_number
      @bank_name = bank_name
      @account_holder_name = account_holder_name
      options = @@option_defaults.merge(options)
      @echeck_type = options[:echeck_type]
      @check_number = options[:check_number]
      @account_type = options[:account_type]
    end

    def to_hash
      hash = {
        method: PAYMENT_METHOD_CODE,
        bank_aba_code: @routing_number,
        bank_acct_num: @account_number,
        bank_acct_type: @account_type,
        bank_name: @bank_name,
        bank_acct_name: @account_holder_name,
        echeck_type: @echeck_type
      }
      hash[:bank_check_number] = @check_number unless @check_number.nil?
      hash
    end
  end
end
