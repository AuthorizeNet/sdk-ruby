module AuthorizeNet::API
  class ApiTransaction < AuthorizeNet::XmlTransaction
    
    def initialize(api_login_id, api_transaction_key, options = {})
       super
    end
    
    def make_request(request,responseClass)
     unless responseClass.nil? or request.nil?
       begin
        @xml = serialize(request)
        respXml = send_request(@xml)
        @response = deserialize(respXml.body,responseClass) 
       rescue Exception => msg  
          puts msg  
       end 
     end
    end
    
    def serialize(object)
      doc = Nokogiri::XML::Document.new
      doc.root = object.to_xml     
     
      builder = Nokogiri::XML::Builder.new(:encoding => 'utf-8') do |x|
        x.send(@type.to_sym, :xmlns => XML_NAMESPACE) {
          x.merchantAuthentication {
            x.name @api_login_id
            x.transactionKey @api_transaction_key
            }
         x.send:insert, doc.root.first_element_child
      }
      end
      builder.to_xml 
    end
    
    def send_request(xml)
      url = URI.parse(@gateway)
             
      httpRequest = Net::HTTP::Post.new(url.path)
      httpRequest.content_type = 'text/xml'
      httpRequest.body = xml
      connection = Net::HTTP.new(url.host, url.port)
      connection.use_ssl = true
      if @verify_ssl
        connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
      else
        connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      
      response = connection.start {|http| http.request(httpRequest)}
    end
    
    def deserialize(xml,responseClass)
      responseClass.from_xml(xml)
    end
  end
end