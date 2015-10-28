module AuthorizeNet::ARB

  # Models an ARB subscription.
  class Subscription
    
    # Use this constant for the value of total_occurrences to get a subscription with no end.
    UNLIMITED_OCCURRENCES = 9999
    
    # Constants for the various interval units supported by the ARB API.
    module IntervalUnits
      MONTH = 'months'
      DAY = 'days'
    end
    
    # Constants for the various statuses a subscription can have. These are returned by the get_status call.
    module Status
      ACTIVE = 'active'
      EXPIRED = 'expired'
      SUSPENDED = 'suspended'
      CANCELED = 'canceled'
      TERMINATED = 'terminated'
    end
    
    include AuthorizeNet::Model
    
    attr_accessor :name, :length, :unit, :start_date, :total_occurrences, :trial_occurrences, :amount, :trial_amount, :invoice_number, :description, :subscription_id, :credit_card, :billing_address, :shipping_address, :customer
    
    # Override the total_occurrences setter to provide support for :unlimited shortcut.
    def total_occurrences=(new_total_occurrences) #:nodoc:
      if new_total_occurrences == :unlimited
        @total_occurrences = UNLIMITED_OCCURRENCES
      else
        @total_occurrences = new_total_occurrences
      end
    end
    
    # Override the unit setter to provide support for :day, :days, :month, :months shortcut. Do not document this method in rdoc.
    def unit=(new_unit) #:nodoc:
      case new_unit
      when :day, :days
        @unit = IntervalUnits::DAY
      when :month, :months
        @unit = IntervalUnits::MONTH
      else
        @unit = new_unit
      end
    end
    
    def to_hash
      hash = {
        :subscription_name => @name,
        :subscription_length => @length,
        :subscription_unit => @unit,
        :subscription_start_date => @start_date,
        :subscription_total_occurrences => @total_occurrences,
        :subscription_trial_occurrences => @trial_occurrences,
        :subscription_amount => @amount,
        :subscription_trial_amount => @trial_amount,
        :invoice_num => @invoice_number,
        :description => @description,
        :subscription_id => @subscription_id
      }
      hash.merge!(@credit_card.to_hash) unless @credit_card.nil?
      hash.merge!(@billing_address.to_hash) unless @billing_address.nil?
      hash.merge!(@shipping_address.to_hash) unless @shipping_address.nil?
      hash.merge!(@customer.to_hash) unless @customer.nil?
      hash.delete_if {|k, v| v.nil?}
    end
    
  end

end