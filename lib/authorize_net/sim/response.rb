module AuthorizeNet::SIM
  
  # The SIM response class. Handles parsing the response from the gateway. Also
  # provides a few relay response helpers used to implement Direct Post Method.
  class Response < AuthorizeNet::KeyValueResponse
    
    # Our MD5 digest generator.
    @@digest = OpenSSL::Digest.new('md5')

    include AuthorizeNet::SIM::Fields
    
    # Constructs a new response object from a +raw_response+. Provides utility methods
    # for validating the response as authentic, and for handling the Direct Post Method
    # relay response.
    # 
    # +raw_response+:: The raw response, either a string in POST body or GET query string format, or a hash of key/value pairs.
    # 
    # Typical usage:
    #   response = AuthorizeNet::SIM::Response("x_first_name=John&x_last_name=Doe")
    def initialize(raw_response)
      @raw_response = raw_response
      @custom_fields = {}
      @fields = {}
      parse_response(@raw_response)
    end
    
    
    # Returns True if the MD5 hash found in the response payload validates using
    # the supplied api_login and secret merchant_value (THIS IS NOT YOUR API KEY).
    def valid_md5?(api_login, merchant_value)
      if @fields[:MD5_Hash].nil?
        return false
      end
      @@digest.hexdigest("#{merchant_value}#{api_login}#{@fields[:trans_id]}#{@fields[:amount]}").downcase == @fields[:MD5_Hash].downcase
    end
    
    # Returns an HTML string that can be returned to the gateway during the Relay Response,
    # and will send the user on to URL you specify. Takes a hash of options, currently the
    # only option is :include, which can be True to include all fields returned in the response
    # as query string parameters, or it can be an array of fields to include.
    def direct_post_reply(url, options = {})
      url = direct_post_url(url, options[:include]) if options.has_key?(:include)
      js_url = url.gsub("'", '\'')
      html_url = url.gsub('&', '&amp;').gsub('"', "\"")
      html = <<-HTML
<html><head><script type="text/javascript" charset="utf-8">window.location='#{js_url}';</script><noscript><meta http-equiv="refresh" content="1;url=#{html_url}"></noscript></head><body></body></html>
HTML
    end
    
    # Returns an URL with the fields found in the response and specified in include_fields attached as
    # part of the URL's query string. If you pass true instead of an array of fields, all fields will be
    # attached.
    def direct_post_url(base_url, include_fields = true)
      url = base_url
      if include_fields
        fields = []
        case include_fields
        when TrueClass
          fields = FIELDS.collect do |k|
            k_str = k.to_s
            k_str[2..k_str.length].to_sym
          end
        when Array
          fields = include_fields
        else
          fields = include_fields.to_a
        end
        parsed_url = URI.parse(url)
        if parsed_url.query.nil?
          parsed_url.query = ''
        elsif parsed_url.query.length != 0
          parsed_url.query = parsed_url.query.chomp('&') + '&'
        end
        parsed_url.query += ((fields.select { |k| @fields.has_key?(k) }).collect { |k| self.to_param(k, @fields[k]) }).join('&')
        parsed_url.query.chomp('&')
        url = parsed_url.to_s
      end
      url
    end
    
    # Check to see if the response indicated success. Success is defined as a valid MD5 hash
    # and an response code of AuthorizeNet::Response::ResponseCode::APPROVED.
    def success?(api_login, merchant_value)
      valid_md5?(api_login, merchant_value) && approved?
    end
    
    # Returns the transaction's authorization code. This should be shown to the
    # end user.
    def authorization_code
      @fields[:auth_code]
    end
    
    # Returns the transaction's authorization id. You will need this for future void, refund
    # and prior authorization capture requests.
    def transaction_id
      @fields[:trans_id]
    end
    
    # Returns the customer id from the response.
    def customer_id
      @fields[:cust_id]
    end
    
    # Returns a response code (from AVSResponseCode) indicating the result of any Address Verification
    # Service checks. 
    def avs_response
      @fields[:avs_code]
    end
    
    #:enddoc:
    protected
    
    # Internal helper to parse the raw response object. It handles both raw POST bodies and
    # hashes.
    def parse_response(raw_response)
      case raw_response
      when Hash
        raw_response.each do |k, v|
          k = k.to_sym
          if FIELDS.include?(k)
            @fields[to_internal_field(k)] = v # remove x_ from sym and stick in @fields
          else
            @custom_fields[k] = v
          end
        end
      when String
        # convert to hash and re-parse
        hash = CGI::parse(raw_response)
        hash.each do |k, v|
          if v.kind_of?(Array) && v.length == 1
            hash[k] = v[0]
          end
        end
        parse_response(hash)
      else
        parse_response(@raw_response.to_s)
      end
    end
    
  end

end