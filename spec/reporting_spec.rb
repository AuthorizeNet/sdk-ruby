require "spec_helper"

describe AuthorizeNet::Reporting do
  before :all do
    begin
      creds = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")
      @api_key = creds['api_transaction_key']
      @api_login = creds['api_login_id']
    rescue Errno::ENOENT => e
      @api_key = "TEST"
      @api_login = "TEST"
      warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
    end
  end

  it "should support instantiation" do
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should be_kind_of(AuthorizeNet::Reporting::Transaction)
  end

  it "should be able to fetch a list of settled batches" do
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_settled_batch_list)
    response = transaction.get_settled_batch_list
    response.success?.should be_truthy
    response.should respond_to(:batch_list)
  end

  it "should be able to fetch a list of settled batches with start and end dates" do
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_settled_batch_list)
    response = transaction.get_settled_batch_list(Time.now() - (1 * 3600 * 12), Time.now())
    response.success?.should be_truthy
    response.should respond_to(:batch_list)
  end

  it "should be able to fetch a list of settled batches with statistics" do
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_settled_batch_list)
    response = transaction.get_settled_batch_list(nil, nil, true)
    response.success?.should be_truthy
    response.should respond_to(:batch_list)
  end

  it "should be able to fetch a transaction list" do
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_transaction_list)
    response = transaction.get_transaction_list('111111')
    response.success?.should be_truthy
    response.should respond_to(:transactions)
  end

  it "should be able to fetch a list of unsettled transactions" do
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_unsettled_transaction_list)
    response = transaction.get_unsettled_transaction_list
    puts response.inspect unless response.success?
    response.success?.should be_truthy
    response.should respond_to(:transactions)
  end

  it "should be able to fetch transaction details" do
    # create a transaction to fetch
    transaction = AuthorizeNet::AIM::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
    transaction.set_fields(:duplicate_window => 0)
    response = transaction.purchase(10.0, credit_card)

    # fetch the transaction
    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_transaction_details)
    response = transaction.get_transaction_details(response.transaction_id)
    response.success?.should be_truthy
    response.should respond_to(:transaction)
  end
=begin
  # To get this test to run.  You must setup an ARB subscription. After the subscription runs a transaction get
  # the transaction_id and put it in this test.
  it "should be able to fetch transaction details with subscription info" do
    transaction_id = 2212429253

    transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
    transaction.should respond_to(:get_transaction_details)
    detail_response = transaction.get_transaction_details(transaction_id)
    detail_response.success?.should be_truthy
    detail_response.should respond_to(:transaction)
    detail_response.transaction.subscription_id.should == 2072134
    detail_response.transaction.subscription_paynum.should == 1
  end
=end
  describe "parsing batch statistics" do
    before do
      @response = '<getSettledBatchListResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
        <messages>
          <resultCode>Ok</resultCode>
          <message>
            <code>I00001</code>
            <text>Successful.</text>
          </message>
        </messages>
        <batchList>
          <batch>
            <batchId>834677</batchId>
            <settlementTimeUTC>2010-12-07T23:57:05Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-07T15:57:05</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
            <paymentMethod>creditCard</paymentMethod>
            <statistics>
              <statistic>
                <accountType>Visa</accountType>
                <chargeAmount>799.92</chargeAmount>
                <chargeCount>17</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>4</voidCount>
                <declineCount>0</declineCount>
                <errorCount>0</errorCount>
              </statistic>
            </statistics>
          </batch>
          <batch>
            <batchId>834801</batchId>
            <settlementTimeUTC>2010-12-08T00:17:57Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-07T16:17:57</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
            <paymentMethod>creditCard</paymentMethod>
            <statistics>
              <statistic>
                <accountType>Visa</accountType>
                <chargeAmount>594.77</chargeAmount>
                <chargeCount>16</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>4</voidCount>
                <declineCount>0</declineCount>
                <errorCount>0</errorCount>
              </statistic>
            </statistics>
          </batch>
          <batch>
            <batchId>835158</batchId>
            <settlementTimeUTC>2010-12-08T00:29:31Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-07T16:29:31</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
            <paymentMethod>creditCard</paymentMethod>
            <statistics>
              <statistic>
                <accountType>Visa</accountType>
                <chargeAmount>786.22</chargeAmount>
                <chargeCount>17</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>4</voidCount>
                <declineCount>0</declineCount>
                <errorCount>0</errorCount>
              </statistic>
            </statistics>
          </batch>
          <batch>
            <batchId>835509</batchId>
            <settlementTimeUTC>2010-12-08T09:40:51Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-08T01:40:51</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
            <paymentMethod>creditCard</paymentMethod>
            <statistics>
              <statistic>
                <accountType>Visa</accountType>
                <chargeAmount>180.00</chargeAmount>
                <chargeCount>18</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>0</voidCount>
                <declineCount>0</declineCount>
                <errorCount>0</errorCount>
              </statistic>
            </statistics>
          </batch>
          <batch>
            <batchId>835896</batchId>
            <settlementTimeUTC>2010-12-08T17:21:43Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-08T09:21:43</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
            <paymentMethod>creditCard</paymentMethod>
            <statistics>
              <statistic>
                <accountType>Visa</accountType>
                <chargeAmount>3357.32</chargeAmount>
                <chargeCount>67</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>16</voidCount>
                <declineCount>1</declineCount>
                <errorCount>0</errorCount>
              </statistic>
            </statistics>
          </batch>
          <batch>
            <batchId>836099</batchId>
            <settlementTimeUTC>2010-12-08T19:52:26Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-08T11:52:26</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
            <paymentMethod>creditCard</paymentMethod>
            <statistics>
              <statistic>
                <accountType>Visa</accountType>
                <chargeAmount>973.24</chargeAmount>
                <chargeCount>17</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>4</voidCount>
                <declineCount>0</declineCount>
                <errorCount>0</errorCount>
              </statistic>
              <statistic>
                <accountType>MasterCard</accountType>
                <chargeAmount>973.24</chargeAmount>
                <chargeCount>17</chargeCount>
                <refundAmount>0.00</refundAmount>
                <refundCount>0</refundCount>
                <voidCount>4</voidCount>
                <declineCount>0</declineCount>
                <errorCount>0</errorCount>
              </statistic>
            </statistics>
          </batch>
        </batchList>
      </getSettledBatchListResponse>'
    end

    it "should be able to build a batch statistics entity" do
      # stub our connection response
      net_response = Net::HTTPOK.new('1.1', 200, 'OK')
      net_response.stub(:body).and_return(@response)
      connection = Net::HTTP.new('http://www.example.com')
      connection.stub(:start).and_return(net_response)
      Net::HTTP.stub(:new).and_return(connection)

      transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_settled_batch_list)
      response = transaction.get_settled_batch_list(nil, nil, true)
      response.success?.should be_truthy
      response.should respond_to(:batch_list)
      batches = response.batch_list
      batches.length.should == 6
      batches.each do |batch|
        batch.statistics.should be_kind_of(Array)
        batch.statistics[0].should be_kind_of(AuthorizeNet::Reporting::BatchStatistics)
        if batch.id == '836099'
          batch.statistics.length.should == 2
          batch.statistics[1].account_type.should == 'MasterCard'
          batch.payment_method.should == 'creditCard'
          batch.statistics[1].charge_amount.should == 973.24
          batch.statistics[1].void_count.should == 4
        end
      end
    end
  end

  describe "parsing transaction details" do
    it "should be able to build a transaction details object from the transaction list response" do
      @response = '<getTransactionListResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
        <messages>
          <resultCode>Ok</resultCode>
          <message>
            <code>I00001</code>
            <text>Successful.</text>
          </message>
        </messages>
        <transactions>
          <transaction>
            <transId>2156238989</transId>
            <submitTimeUTC>2010-12-07T23:50:02Z</submitTimeUTC>
            <submitTimeLocal>2010-12-07T15:50:02</submitTimeLocal>
            <transactionStatus>settledSuccessfully</transactionStatus>
            <accountType>Visa</accountType>
            <accountNumber>XXXX1111</accountNumber>
            <settleAmount>38.37</settleAmount>
          </transaction>
          <transaction>
            <transId>2156238988</transId>
            <submitTimeUTC>2010-12-07T23:50:01Z</submitTimeUTC>
            <submitTimeLocal>2010-12-07T15:50:01</submitTimeLocal>
            <transactionStatus>voided</transactionStatus>
            <accountType>Visa</accountType>
            <accountNumber>XXXX1111</accountNumber>
            <settleAmount>0.00</settleAmount>
          </transaction>
          <transaction>
             <transId>2156246780</transId>
             <submitTimeUTC>2010-12-08T09:31:01Z</submitTimeUTC>
             <submitTimeLocal>2010-12-08T01:31:01</submitTimeLocal>
             <transactionStatus>settledSuccessfully</transactionStatus>
             <invoiceNumber>0.0119129953556076</invoiceNumber>
             <firstName>John</firstName>
             <lastName>Doe</lastName>
             <accountType>Visa</accountType>
             <accountNumber>XXXX1111</accountNumber>
             <settleAmount>10.00</settleAmount>
             <hasReturnedItems>true</hasReturnedItems>
             <subscription>
               <id>2334316</id>
               <payNum>3</payNum>
             </subscription>
           </transaction>
        </transactions>
      </getTransactionListResponse>'

      # stub our connection response
      net_response = Net::HTTPOK.new('1.1', 200, 'OK')
      net_response.stub(:body).and_return(@response)
      connection = Net::HTTP.new('http://www.example.com')
      connection.stub(:start).and_return(net_response)
      Net::HTTP.stub(:new).and_return(connection)

      transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_transaction_list)
      response = transaction.get_settled_batch_list('111111')
      response.success?.should be_truthy
      response.should respond_to(:transactions)
      transactions = response.transactions
      transactions.length.should == 3
      transactions[0].account_type.should == 'Visa'
      transactions[0].settle_amount.should == 38.37
      transactions[0].submitted_at.should == DateTime.parse('2010-12-07T23:50:02Z')
      transactions[0].status = 'voided'
      transactions[2].subscription_id.should == '2334316'
      customer = transactions[2].customer
      customer.nil?.should be_falsey
      customer.address.nil?.should be_falsey
      customer.address.first_name.should == 'John'
      customer.address.last_name.should == 'Doe'
      order = transactions[2].order
      order.nil?.should be_falsey
      order.invoice_num.should == '0.0119129953556076'
      transactions[2].returns.should be_truthy
      transactions[0].returns.should be_falsey
    end

    it "should be able to build a transaction details object from the transaction details response" do
      @response = '<getTransactionDetailsResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
        <messages>
          <resultCode>Ok</resultCode>
          <message>
            <code>I00001</code>
            <text>Successful.</text>
          </message>
        </messages>
        <transaction>
          <transId>2156246780</transId>
          <submitTimeUTC>2010-12-08T09:31:01.01Z</submitTimeUTC>
          <submitTimeLocal>2010-12-08T01:31:01.01</submitTimeLocal>
          <transactionType>authCaptureTransaction</transactionType>
          <transactionStatus>settledSuccessfully</transactionStatus>
          <responseCode>1</responseCode>
          <responseReasonCode>1</responseReasonCode>
          <responseReasonDescription>Approval</responseReasonDescription>
          <authCode>5N3WKF</authCode>
          <AVSResponse>Y</AVSResponse>
          <batch>
            <batchId>835509</batchId>
            <settlementTimeUTC>2010-12-08T09:40:51.12Z</settlementTimeUTC>
            <settlementTimeLocal>2010-12-08T01:40:51.12</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
          </batch>
          <order>
            <invoiceNumber>0.0119129953556076</invoiceNumber>
            <description>a test subscription</description>
          </order>
          <authAmount>10.00</authAmount>
          <settleAmount>10.00</settleAmount>
          <lineItems>
            <lineItem>
              <itemId>ITEM00001</itemId>
              <name>name of item sold</name>
              <description>Description of item sold</description>
              <quantity>1</quantity>
              <unitPrice>6.95</unitPrice>
              <taxable>true</taxable>
            </lineItem>
            <lineItem>
              <itemId>ITEM00002</itemId>
              <name>name of item sold</name>
              <description>Description of item sold</description>
              <quantity>1</quantity>
              <unitPrice>7.95</unitPrice>
              <taxable>true</taxable>
            </lineItem>
          </lineItems>
          <taxExempt>false</taxExempt>
          <payment>
            <creditCard>
              <cardNumber>XXXX1111</cardNumber>
              <expirationDate>XXXX</expirationDate>
              <cardType>Visa</cardType>
            </creditCard>
          </payment>
          <customer>
            <type>individual</type>
            <id>ABC00001</id>
            <email>mark@example.com</email>
          </customer>
          <billTo>
            <firstName>John</firstName>
            <lastName>Doe</lastName>
          </billTo>
          <recurringBilling>false</recurringBilling>
          <customerIP>127.0.0.1</customerIP>
        </transaction>
      </getTransactionDetailsResponse>'

      # stub our connection response
      net_response = Net::HTTPOK.new('1.1', 200, 'OK')
      net_response.stub(:body).and_return(@response)
      connection = Net::HTTP.new('http://www.example.com')
      connection.stub(:start).and_return(net_response)
      Net::HTTP.stub(:new).and_return(connection)

      transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_transaction_details)
      response = transaction.get_transaction_details('2212429253')
      response.success?.should be_truthy
      response.should respond_to(:transaction)
      transaction = response.transaction

      transaction.should be_kind_of(AuthorizeNet::Reporting::TransactionDetails)
      transaction.response_code.should == "1"
      transaction.response_reason_code.should == "1"
      transaction.response_reason_description.should == "Approval"
      transaction.auth_code.should == "5N3WKF"
      transaction.avs_response.should == 'Y'
      transaction.auth_amount.should == 10.00
      transaction.settle_amount.should == 10.00
      transaction.recurring_billing.should be_truthy

      transaction.order.should be_kind_of(AuthorizeNet::Order)
      transaction.order.line_items.should be_kind_of(Array)
      transaction.order.line_items.length.should == 2
      transaction.order.line_items[0].should be_kind_of(AuthorizeNet::LineItem)
      transaction.order.tax_exempt.should be_falsey

      transaction.payment_method.should be_kind_of(AuthorizeNet::CreditCard)
      transaction.payment_method.card_number.should == 'XXXX1111'

      transaction.batch.should be_kind_of(AuthorizeNet::Reporting::Batch)
      transaction.batch.id.should == '835509'
      transaction.batch.settled_at.should == DateTime.civil(2010, 12, 8, 9, 40, 51)

      transaction.bill_to.should be_kind_of(AuthorizeNet::Address)
      transaction.bill_to.first_name.should == 'John'
      transaction.bill_to.last_name.should == 'Doe'

      transaction.customer.should be_kind_of(AuthorizeNet::Customer)
      transaction.customer.ip.should == '127.0.0.1'
      transaction.customer.id.should == 'ABC00001'
      transaction.customer.email.should == 'mark@example.com'
      transaction.customer.payment_profiles.should be_kind_of(Array)
      transaction.customer.payment_profiles.length.should == 1
      transaction.customer.payment_profiles[0].cust_type.should == 'individual'
    end

    it "should be able to build a transaction details object with subscription info from the transaction details response" do
      @response = '<getTransactionDetailsResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                               xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                               xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
        <messages>
          <resultCode>Ok</resultCode>
          <message>
            <code>I00001</code>
            <text>Successful.</text>
          </message>
        </messages>
        <transaction>
          <transId>2212429253</transId>
          <submitTimeUTC>2014-05-04T08:51:10.79Z</submitTimeUTC>
          <submitTimeLocal>2014-05-04T01:51:10.79</submitTimeLocal>
          <transactionType>authCaptureTransaction</transactionType>
          <transactionStatus>settledSuccessfully</transactionStatus>
          <responseCode>1</responseCode>
          <responseReasonCode>1</responseReasonCode>
          <subscription>
            <id>2072134</id>
            <payNum>1</payNum>
          </subscription>
          <responseReasonDescription>Approval</responseReasonDescription>
          <authCode>JJRP3T</authCode>
          <AVSResponse>Y</AVSResponse>
          <batch>
            <batchId>3395320</batchId>
            <settlementTimeUTC>2014-05-05T02:04:50.827Z</settlementTimeUTC>
            <settlementTimeLocal>2014-05-04T19:04:50.827</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
          </batch>
          <authAmount>40000.00</authAmount>
          <settleAmount>40000.00</settleAmount>
          <taxExempt>false</taxExempt>
          <payment>
            <creditCard>
              <cardNumber>XXXX1111</cardNumber>
              <expirationDate>XXXX</expirationDate>
              <cardType>Visa</cardType>
            </creditCard>
          </payment>
          <billTo>
            <firstName>Third</firstName>
            <lastName>Time</lastName>
          </billTo>
          <recurringBilling>false</recurringBilling>
          <product>Card Not Present</product>
          <marketType>eCommerce</marketType>
        </transaction>
      </getTransactionDetailsResponse>'

      # stub our connection response
      net_response = Net::HTTPOK.new('1.1', 200, 'OK')
      net_response.stub(:body).and_return(@response)
      connection = Net::HTTP.new('http://www.example.com')
      connection.stub(:start).and_return(net_response)
      Net::HTTP.stub(:new).and_return(connection)

      transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_transaction_details)
      response = transaction.get_transaction_details('2212429253')
      response.success?.should be_truthy
      response.should respond_to(:transaction)
      transaction = response.transaction

      transaction.should be_kind_of(AuthorizeNet::Reporting::TransactionDetails)
      transaction.response_code.should == "1"
      transaction.response_reason_code.should == "1"
      transaction.response_reason_description.should == "Approval"
      transaction.subscription_id.should == 2072134
      transaction.subscription_paynum.should == 1
      transaction.auth_code.should == "JJRP3T"
      transaction.avs_response.should == 'Y'
      transaction.auth_amount.should == 40000.00
      transaction.settle_amount.should == 40000.00
      transaction.recurring_billing.should be_truthy
    end

    it "should be able to build an echeck transaction details object with returned items and solution from the transaction details response" do
      @response = '<getTransactionDetailsResponse
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
        <messages>
          <resultCode>Ok</resultCode>
          <message>
            <code>I00001</code>
            <text>Successful.</text>
          </message>
        </messages>
        <transaction>
          <transId>2148887936</transId>
          <submitTimeUTC>2014-05-27T19:25:27.23Z</submitTimeUTC>
          <submitTimeLocal>2014-05-27T12:25:27.23</submitTimeLocal>
          <transactionType>authCaptureTransaction</transactionType>
          <transactionStatus>settledSuccessfully</transactionStatus>
          <responseCode>1</responseCode>
          <responseReasonCode>1</responseReasonCode>
          <responseReasonDescription>Approval</responseReasonDescription>
          <AVSResponse>P</AVSResponse>
          <batch>
            <batchId>10155860</batchId>
            <settlementTimeUTC>2014-05-27T19:25:28.237Z</settlementTimeUTC>
            <settlementTimeLocal>2014-05-27T12:25:28.237</settlementTimeLocal>
            <settlementState>settledSuccessfully</settlementState>
          </batch>
          <order>
            <invoiceNumber>QaInv01vgphtbrhbdh</invoiceNumber>
          </order>
          <authAmount>12.00</authAmount>
          <settleAmount>12.00</settleAmount>
          <taxExempt>false</taxExempt>
          <payment>
            <bankAccount>
              <routingNumber>XXXX0204</routingNumber>
              <accountNumber>XXXX2516</accountNumber>
              <nameOnAccount>Account Owner</nameOnAccount>
              <echeckType>WEB</echeckType>
            </bankAccount>
          </payment>
          <recurringBilling>false</recurringBilling>
          <returnedItems>
            <returnedItem>
              <id>2148887937</id>
              <dateUTC>2014-05-27T19:25:49Z</dateUTC>
              <dateLocal>2014-05-27T12:25:49</dateLocal>
              <code>R02</code>
              <description>Account Closed</description>
            </returnedItem>
            <returnedItem>
              <id>2148887938</id>
              <dateUTC>2014-06-27T19:25:49Z</dateUTC>
              <dateLocal>2014-06-27T12:25:49</dateLocal>
              <code>R03</code>
              <description>Test</description>
            </returnedItem>
          </returnedItems>
          <solution>
            <id>1000004</id>
            <name>Volusion Shopping Cart</name>
          </solution>
        </transaction>
        </getTransactionDetailsResponse>'

      # stub our connection response
      net_response = Net::HTTPOK.new('1.1', 200, 'OK')
      net_response.stub(:body).and_return(@response)
      connection = Net::HTTP.new('http://www.example.com')
      connection.stub(:start).and_return(net_response)
      Net::HTTP.stub(:new).and_return(connection)

      transaction = AuthorizeNet::Reporting::Transaction.new(@api_login, @api_key, :gateway => :sandbox)
      transaction.should respond_to(:get_transaction_details)
      response = transaction.get_transaction_details('2212429253')
      response.success?.should be_truthy
      response.should respond_to(:transaction)
      transaction = response.transaction

      transaction.should be_kind_of(AuthorizeNet::Reporting::TransactionDetails)
      transaction.response_code.should == "1"
      transaction.response_reason_code.should == "1"
      transaction.response_reason_description.should == "Approval"
      transaction.solution_id = 'A1000004'
      transaction.solution_name = 'Volusion Shopping Cart'

      transaction.returns.returned_items.length.should == 2
      transaction.returns.returned_items.should be_kind_of(Array)
      transaction.returns.returned_items[0].should be_kind_of(AuthorizeNet::Reporting::ReturnedItem)
      transaction.returns.returned_items[0].id = 2148887938
      transaction.returns.returned_items[0].code = 'R02'
      transaction.returns.returned_items[0].code = 'Account Closed'
    end
  end
end
