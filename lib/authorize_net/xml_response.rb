module AuthorizeNet
  # The core, xml response class. You shouldn't instantiate this one.
  # Instead you should use AuthorizeNet::ARB::Response.
  class XmlResponse < AuthorizeNet::Response
    # DO NOT USE. Instantiate AuthorizeNet::ARB::Response or AuthorizeNet::CIM::Response instead.
    def initialize(raw_response, transaction)
      @raw_response = raw_response
      @transaction = transaction
      unless connection_failure?
        begin
          xml = Nokogiri::XML(@raw_response.body) do |config|
            # confirm noent is the right flag
            config.recover.noent.nonet
          end
          @root = xml.children[0]
          @result_code = node_content_unless_nil(@root.at_css('messages resultCode'))
          @message_code = node_content_unless_nil(@root.at_css('messages message code'))
          @message_text = node_content_unless_nil(@root.at_css('messages message text'))
          @reference_id = node_content_unless_nil(@root.at_css('refId'))
        rescue
          @raw_response = $ERROR_INFO
        end
      end
    end

    # Check to see if the response indicated success. Success is defined as a 200 OK response with a resultCode
    # of 'Ok'.
    def success?
      !connection_failure? && @result_code == 'Ok'
    end

    # Returns true if we failed to open a connection to the gateway or got back a non-200 OK HTTP response.
    def connection_failure?
      !@raw_response.is_a?(Net::HTTPOK)
    end

    # Returns the underlying Net::HTTPResponse object. This has the original response body along with
    # headers and such. Note that if an exception is generated while making the request (which happens
    # if there is no internet connection for example), you will get the exception object here instead of
    # a Net::HTTPResponse object.
    def raw
      @raw_response
    end

    # Returns a deep-copy of the XML object received from the payment gateway. Or nil if there was no XML payload.
    def xml
      @root.dup unless @root.nil?
    end

    # Returns the resultCode from the XML response. resultCode will be either 'Ok' or 'Error'.
    attr_reader :result_code

    # Returns the messageCode from the XML response. This is a code indicating the details of an error
    # or success.
    attr_reader :message_code

    # Returns the messageText from the XML response. This is a text description of the message_code.
    attr_reader :message_text

    # Alias for result_code.
    def response_code
      result_code
    end

    # Alias for message_code.
    def response_reason_code
      message_code
    end

    # Alias for message_text.
    def response_reason_text
      message_text
    end

    # Returns the refId from the response if there is one. Otherwise returns nil.
    attr_reader :reference_id

    #:enddoc:
    protected

    def node_content_unless_nil(node)
      if node.nil?
        nil
      else
        node.content
      end
    end

    def node_child_content_unless_nil(node)
      if node.nil?
        nil
      else
        node.children.collect(&:content) unless node.children.empty?
      end
    end

    # Transforms a block of XML into a model Object defined by entity_desc.
    def build_entity(xml, entity_desc)
      args = {}
      entity_desc.node_structure.each do |node_desc|
        node_name = (node_desc.keys.reject { |k| k.to_s[0..0] == '_' }).first
        args.merge!(handle_node_type(xml, node_desc, node_name, args, ''))
      end

      return nil if args.empty?

      if entity_desc.arg_mapping.nil?
        return entity_desc.entity_class.new(args)
      else
        args_list = []
        entity_desc.arg_mapping.each do |arg|
          args_list <<= args[arg]
          args.delete(arg)
        end
        args_list <<= args
        return entity_desc.entity_class.new(*args_list)
      end
    end

    # Parses an XML fragment into an internal representation.
    def handle_node_type(xml, node_desc, node_name, args, base_name)
      case node_desc[node_name]
      when Symbol
        node = xml.at_css(base_name + node_name.to_s)
        unless node.nil?
          content = node.content
          case node_desc[:_converter]
          when Method, Proc
            content = node_desc[:_converter].call(content)
          when Symbol
            content = send(node_desc[:_converter], content)
          end
          args[node_desc[node_name]] = content unless content.nil?
        end
      when AuthorizeNet::EntityDescription
        if node_desc[:_multivalue].nil?
          entity = build_entity(xml.css(base_name + node_name.to_s), node_desc[node_name])
          args[node_desc[:_value]] = entity unless entity.nil?
        else
          xml.css(base_name + node_name.to_s).each do |node|
            entity = build_entity(node, node_desc[node_name])
            args[node_desc[:_multivalue]] = args[node_desc[:_multivalue]].to_a + entity.to_a unless entity.nil?
          end
        end
      when Array
        node_desc[node_name].each do |inner_node|
          inner_node_name = (inner_node.keys.reject { |k| k.to_s[0..0] == '_' }).first
          args.merge!(handle_node_type(xml, inner_node, inner_node_name, args, node_name.to_s + ' '))
        end
      end
      args
    end
  end
end
