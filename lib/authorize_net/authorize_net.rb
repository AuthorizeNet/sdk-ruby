# :title: Authorize.Net Ruby SDK
# The core AuthoizeNet module.
# The entire SDK is name-spaced inside of this module.
module AuthorizeNet
  
  # Some type conversion routines that will be injected into our
  # Transaction/Response classes.
  module TypeConversions

    API_FIELD_PREFIX = 'x_'

    # Converts a value received from Authorize.Net into a boolean if
    # possible. This is designed to handle the wide range of boolean
    # formats that Authorize.Net uses.
    def value_to_boolean(value)
      case value
      when "TRUE", "T", "YES", "Y", "1", "true"
        true
      when "FALSE", "F", "NO", "N", "0", "false"
        false
      else
        value
      end
    end
    
    # Converts a boolean into an Authorize.Net boolean value string.
    # This is designed to handle the wide range of boolean formats that
    # Authorize.Net uses. If bool isn't a Boolean, its converted to a
    # string and passed along.
    def boolean_to_value(bool)
      case bool
      when TrueClass, FalseClass
        bool ? 'TRUE' : 'FALSE'
      else
        bool.to_s
      end
    end
    
    # Converts a value received from Authorize.Net into a BigDecimal.
    def value_to_decimal(value)
      value = 0 if value == '' # Ruby 2.4+ does not accept ""
      BigDecimal.new(value)
    end
    
    # Converts a BigDecimal (or Float) into an Authorize.Net float value
    # string. If float isn't a BigDecimal (or Float), its converted to a
    # string and passed along.
    def decimal_to_value(float)
      case float
      when Float
        "%0.2f" % float
      when BigDecimal
        float.truncate(2).to_s('F')
      else
        float.to_s
      end
    end
    
    # Converts a value received from Authorize.Net into a Date.
    def value_to_date(value)
      Date.strptime(value, '%Y-%m-%d')
    end
    
    # Converts a Date (or DateTime, or Time) into an Authorize.Net date
    # value string. If date isn't a Date (or DateTime, or Time), its
    # converted to a string and passed along.
    def date_to_value(date)
      case date
      when Date, DateTime, Time
        date.strftime('%Y-%m-%d')
      else
        date.to_s
      end
    end
    
    # Converts a value received from Authorize.Net into a DateTime.
    def value_to_datetime(value)
      DateTime.strptime(value, '%Y-%m-%dT%H:%M:%S')
    end
    
    # Converts a Date (or DateTime, or Time) into an Authorize.Net datetime
    # value string. If date isn't a Date (or DateTime, or Time), it's
    # converted to a string and passed along.
    def datetime_to_value(datetime)
      case datetime
      when Date, DateTime
        datetime.new_offset(0).strftime('%Y-%m-%dT%H:%M:%SZ')
      when Time
        datetime.utc.strftime('%Y-%m-%dT%H:%M:%SZ')
      else
        datetime.to_s
      end
    end
    
    # Converts a value received from Authorize.Net into an Integer.
    def value_to_integer(value)
      value.to_s.to_i
    end
    
    # Converts an Integer into an Authorize.Net integer string.
    def integer_to_value(int)
      int.to_s
    end
    
    # Converts a key value pair into a HTTP POST parameter. The key is
    # prefixed with key_prefix when being converted to a parameter name.
    def to_param(key, value, key_prefix = API_FIELD_PREFIX)
      key_str = "#{key_prefix}#{key}="
      if value.kind_of?(Array)
        (value.collect do |v|
          key_str + CGI::escape(v.to_s)
        end).join('&')
      else
        key_str + CGI::escape(value.to_s)
      end
    end 
    
    # Converts an internal field name (Symbol) into an external field
    # name (Symbol) that can be consumed by the Authorize.Net API.
    def to_external_field(key)
      (API_FIELD_PREFIX + key.to_s).to_sym
    end
    
    # Converts an external field name (Symbol) into an internal field
    # name (Symbol). This is the exact inverse of to_external_field.
    # Running to_internal_field(to_external_field(:foo)) would return
    # :foo back.
    def to_internal_field(key)
      k_str = key.to_s
      k_str[API_FIELD_PREFIX.length..k_str.length].to_sym
    end
  end

  # Provides some basic methods used by the various model classes.
  module Model

    # The constructor for models. Takes any of the supported attributes
    # as key/value pairs.
    def initialize(fields = {})
      fields.each do |k, v|
        method_name = (k.to_s + '=').to_sym
        if self.respond_to?(method_name)
          self.send(method_name, v)
        end
      end
    end

    def to_a
      [self]
    end

    #:enddoc:
    protected

    def handle_multivalue_hashing(obj)
      obj.to_a.collect(&:to_hash)
    end

  end

end
