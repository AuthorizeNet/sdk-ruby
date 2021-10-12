# require 'xsd/qname'
require 'roxml'

module AuthorizeNet::API
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfLong
  class ArrayOfLong < ::Array
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfNumericString
  class NumericStringsType
    include ROXML
    xml_reader :numericString, as: []
    def initialize(numericString = [])
      @numericString = numericString
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfString
  class ArrayOfString < ::Array
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfBatchStatisticType
  class ArrayOfBatchStatisticType < ::Array
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}emailSettingsType
  #   setting - SettingType
  #   xmlattr_version - SOAP::SOAPInteger
  class EmailSettingsType
    include ROXML
    # AttrVersion = XSD::QName.new(nil, "version")

    xml_accessor :setting

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_version
      __xmlattr[AttrVersion]
    end

    def xmlattr_version=(value)
      __xmlattr[AttrVersion] = value
    end

    def initialize(setting = [])
      @setting = setting
      @__xmlattr = {}
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfFDSFilter
  class ArrayOfFDSFilter < ::Array
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfPermissionType
  class ArrayOfPermissionType < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfContactDetail
  class ArrayOfContactDetail < ::Array
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}driversLicenseType
  #   number - SOAP::SOAPString
  #   state - SOAP::SOAPString
  #   dateOfBirth - SOAP::SOAPString
  class DriversLicenseType
    include ROXML
    xml_accessor :number
    xml_accessor :state
    xml_accessor :dateOfBirth

    def initialize(number = nil, state = nil, dateOfBirth = nil)
      @number = number
      @state = state
      @dateOfBirth = dateOfBirth
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}driversLicenseMaskedType
  #   number - SOAP::SOAPString
  #   state - SOAP::SOAPString
  #   dateOfBirth - SOAP::SOAPString
  class DriversLicenseMaskedType
    include ROXML
    xml_accessor :number
    xml_accessor :state
    xml_accessor :dateOfBirth

    def initialize(number = nil, state = nil, dateOfBirth = nil)
      @number = number
      @state = state
      @dateOfBirth = dateOfBirth
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}nameAndAddressType
  #   firstName - SOAP::SOAPString
  #   lastName - SOAP::SOAPString
  #   company - SOAP::SOAPString
  #   address - SOAP::SOAPString
  #   city - SOAP::SOAPString
  #   state - SOAP::SOAPString
  #   zip - SOAP::SOAPString
  #   country - SOAP::SOAPString
  class NameAndAddressType
    include ROXML
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :company
    xml_accessor :address
    xml_accessor :city
    xml_accessor :state
    xml_accessor :zip
    xml_accessor :country

    def initialize(firstName = nil, lastName = nil, company = nil, address = nil, city = nil, state = nil, zip = nil, country = nil)
      @firstName = firstName
      @lastName = lastName
      @company = company
      @address = address
      @city = city
      @state = state
      @zip = zip
      @country = country
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerAddressType
  #   firstName - SOAP::SOAPString
  #   lastName - SOAP::SOAPString
  #   company - SOAP::SOAPString
  #   address - SOAP::SOAPString
  #   city - SOAP::SOAPString
  #   state - SOAP::SOAPString
  #   zip - SOAP::SOAPString
  #   country - SOAP::SOAPString
  #   phoneNumber - SOAP::SOAPString
  #   faxNumber - SOAP::SOAPString
  class CustomerAddressType
    include ROXML
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :company
    xml_accessor :address
    xml_accessor :city
    xml_accessor :state
    xml_accessor :zip
    xml_accessor :country
    xml_accessor :phoneNumber
    xml_accessor :faxNumber

    def initialize(firstName = nil, lastName = nil, company = nil, address = nil, city = nil, state = nil, zip = nil, country = nil, phoneNumber = nil, faxNumber = nil)
      @firstName = firstName
      @lastName = lastName
      @company = company
      @address = address
      @city = city
      @state = state
      @zip = zip
      @country = country
      @phoneNumber = phoneNumber
      @faxNumber = faxNumber
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerAddressExType
  #   firstName - SOAP::SOAPString
  #   lastName - SOAP::SOAPString
  #   company - SOAP::SOAPString
  #   address - SOAP::SOAPString
  #   city - SOAP::SOAPString
  #   state - SOAP::SOAPString
  #   zip - SOAP::SOAPString
  #   country - SOAP::SOAPString
  #   phoneNumber - SOAP::SOAPString
  #   faxNumber - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerAddressId - (any)
  class CustomerAddressExType
    include ROXML
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :company
    xml_accessor :address
    xml_accessor :city
    xml_accessor :state
    xml_accessor :zip
    xml_accessor :country
    xml_accessor :phoneNumber
    xml_accessor :faxNumber
    xml_accessor :email
    xml_accessor :customerAddressId

    def initialize(firstName = nil, lastName = nil, company = nil, address = nil, city = nil, state = nil, zip = nil, country = nil, phoneNumber = nil, faxNumber = nil, email = nil, customerAddressId = nil)
      @firstName = firstName
      @lastName = lastName
      @company = company
      @address = address
      @city = city
      @state = state
      @zip = zip
      @country = country
      @phoneNumber = phoneNumber
      @faxNumber = faxNumber
      @email = email
      @customerAddressId = customerAddressId
      end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}merchantContactType
  #   merchantName - SOAP::SOAPString
  #   merchantAddress - SOAP::SOAPString
  #   merchantCity - SOAP::SOAPString
  #   merchantState - SOAP::SOAPString
  #   merchantZip - SOAP::SOAPString
  #   merchantPhone - SOAP::SOAPString
  class MerchantContactType
    include ROXML
    xml_accessor :merchantName
    xml_accessor :merchantAddress
    xml_accessor :merchantCity
    xml_accessor :merchantState
    xml_accessor :merchantZip
    xml_accessor :merchantPhone

    def initialize(merchantName = nil, merchantAddress = nil, merchantCity = nil, merchantState = nil, merchantZip = nil, merchantPhone = nil)
      @merchantName = merchantName
      @merchantAddress = merchantAddress
      @merchantCity = merchantCity
      @merchantState = merchantState
      @merchantZip = merchantZip
      @merchantPhone = merchantPhone
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ContactDetailType
  #   email - SOAP::SOAPString
  #   firstName - SOAP::SOAPString
  #   lastName - SOAP::SOAPString
  class ContactDetailType
    include ROXML
    xml_accessor :email
    xml_accessor :firstName
    xml_accessor :lastName    
    def initialize(email = nil, firstName = nil, lastName = nil)
      @email = email
      @firstName = firstName
      @lastName = lastName
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transRetailInfoType
  #   marketType - SOAP::SOAPString
  #   deviceType - SOAP::SOAPString
  class TransRetailInfoType
    include ROXML
    xml_accessor :marketType
    xml_accessor :deviceType
    xml_accessor :customerSignature
    xml_accessor :terminalNumber

    def initialize(marketType = nil, deviceType = nil, customerSignature = nil, terminalNumber = nil)
      @marketType = marketType
      @deviceType = deviceType
      @customerSignature = customerSignature
      @terminalNumber = terminalNumber
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}creditCardSimpleType
  #   cardNumber - SOAP::SOAPString
  #   expirationDate - SOAP::SOAPString
  class CreditCardSimpleType
    include ROXML
    xml_accessor :cardNumber
    xml_accessor :expirationDate

    def initialize(cardNumber = nil, expirationDate = nil)
      @cardNumber = cardNumber
      @expirationDate = expirationDate
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}creditCardType
  #   cardNumber - SOAP::SOAPString
  #   expirationDate - SOAP::SOAPString
  #   cardCode - (any)
  #   isPaymentToken - SOAP::SOAPBoolean
  #   cryptogram - SOAP::SOAPString
  #   tokenRequestorName - SOAP::SOAPString
  #   tokenRequestorId - SOAP::SOAPString
  #   tokenRequestorEci - SOAP::SOAPString
  class CreditCardType
    include ROXML
    xml_accessor :cardNumber
    xml_accessor :expirationDate
    xml_accessor :cardCode
    xml_accessor :isPaymentToken
    xml_accessor :cryptogram
    xml_accessor :tokenRequestorName
    xml_accessor :tokenRequestorId
    xml_accessor :tokenRequestorEci

    def initialize(cardNumber = nil, expirationDate = nil, cardCode = nil, isPaymentToken = nil, cryptogram = nil, tokenRequestorName = nil, tokenRequestorId = nil, tokenRequestorEci = nil)
      @cardNumber = cardNumber
      @expirationDate = expirationDate
      @cardCode = cardCode
      @isPaymentToken = isPaymentToken
      @cryptogram = cryptogram
      @tokenRequestorName = tokenRequestorName
      @tokenRequestorId = tokenRequestorId
      @tokenRequestorEci = tokenRequestorEci
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}creditCardTrackType
  #   track1 - SOAP::SOAPString
  #   track2 - SOAP::SOAPString
  class CreditCardTrackType
    include ROXML
    xml_accessor :track1
    xml_accessor :track2

    def initialize(track1 = nil, track2 = nil)
      @track1 = track1
      @track2 = track2
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}creditCardMaskedType
  #   cardNumber - SOAP::SOAPString
  #   expirationDate - SOAP::SOAPString
  #   cardType - SOAP::SOAPString
  #   cardArt - CardArt
  #   isPaymentToken - SOAP::SOAPBoolean
  class CreditCardMaskedType
    include ROXML
    xml_accessor :cardNumber
    xml_accessor :expirationDate
    xml_accessor :cardType
    xml_accessor :cardArt
    xml_accessor :issuerNumber
    xml_accessor :isPaymentToken

    def initialize(cardNumber = nil, expirationDate = nil, cardType = nil, cardArt = nil, issuerNumber = nil, isPaymentToken = nil)
      @cardNumber = cardNumber
      @expirationDate = expirationDate
      @cardType = cardType
      @cardArt = cardArt
      @issuerNumber = issuerNumber
      @isPaymentToken = isPaymentToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ccAuthenticationType
  #   authenticationIndicator - SOAP::SOAPString
  #   cardholderAuthenticationValue - SOAP::SOAPString
  class CcAuthenticationType
    include ROXML
    xml_accessor :authenticationIndicator
    xml_accessor :cardholderAuthenticationValue

    def initialize(authenticationIndicator = nil, cardholderAuthenticationValue = nil)
      @authenticationIndicator = authenticationIndicator
      @cardholderAuthenticationValue = cardholderAuthenticationValue
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}bankAccountType
  #   accountType - BankAccountTypeEnum
  #   routingNumber - SOAP::SOAPString
  #   accountNumber - SOAP::SOAPString
  #   nameOnAccount - SOAP::SOAPString
  #   echeckType - EcheckTypeEnum
  #   bankName - SOAP::SOAPString
  #   checkNumber - SOAP::SOAPString
  class BankAccountType
    include ROXML
    xml_accessor :accountType
    xml_accessor :routingNumber
    xml_accessor :accountNumber
    xml_accessor :nameOnAccount
    xml_accessor :echeckType
    xml_accessor :bankName
    xml_accessor :checkNumber

    def initialize(accountType = nil, routingNumber = nil, accountNumber = nil, nameOnAccount = nil, echeckType = nil, bankName = nil, checkNumber = nil)
      @accountType = accountType
      @routingNumber = routingNumber
      @accountNumber = accountNumber
      @nameOnAccount = nameOnAccount
      @echeckType = echeckType
      @bankName = bankName
      @checkNumber = checkNumber
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}bankAccountMaskedType
  #   accountType - BankAccountTypeEnum
  #   routingNumber - SOAP::SOAPString
  #   accountNumber - SOAP::SOAPString
  #   nameOnAccount - SOAP::SOAPString
  #   echeckType - EcheckTypeEnum
  #   bankName - SOAP::SOAPString
  class BankAccountMaskedType
    include ROXML
    xml_accessor :accountType
    xml_accessor :routingNumber
    xml_accessor :accountNumber
    xml_accessor :nameOnAccount
    xml_accessor :echeckType
    xml_accessor :bankName

    def initialize(accountType = nil, routingNumber = nil, accountNumber = nil, nameOnAccount = nil, echeckType = nil, bankName = nil)
      @accountType = accountType
      @routingNumber = routingNumber
      @accountNumber = accountNumber
      @nameOnAccount = nameOnAccount
      @echeckType = echeckType
      @bankName = bankName
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}opaqueDataType
  #   dataDescriptor - SOAP::SOAPString
  #   dataValue - SOAP::SOAPString
  #   dataKey - SOAP::SOAPString
  #   expirationTimeStamp - SOAP::SOAPBoolean

  class OpaqueDataType
    include ROXML
    xml_accessor :dataDescriptor
    xml_accessor :dataValue
    xml_accessor :dataKey
    xml_accessor :expirationTimeStamp

     def initialize(dataDescriptor = nil, dataValue = nil, dataKey = nil, expirationTimeStamp=nil)
      @dataDescriptor = dataDescriptor
      @dataValue = dataValue
      @dataKey = dataKey
      @expirationTimeStamp=expirationTimeStamp
    end
end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentEmvType
  #   emvData - SOAP::SOAPString
  #   emvDescriptor - SOAP::SOAPString
  #   emvVersion - SOAP::SOAPString
  class PaymentEmvType
    include ROXML
    xml_accessor :emvData
    xml_accessor :emvDescriptor
    xml_accessor :emvVersion

    def initialize(emvData = nil, emvDescriptor = nil, emvVersion = nil)
      @emvData = emvData
      @emvDescriptor = emvDescriptor
      @emvVersion = emvVersion
    end
end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentSimpleType
  #   creditCard - CreditCardSimpleType
  #   bankAccount - BankAccountType
  class PaymentSimpleType
    include ROXML
    xml_accessor :creditCard
    xml_accessor :bankAccount

    def initialize(creditCard = nil, bankAccount = nil)
      @creditCard = creditCard
      @bankAccount = bankAccount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}OperationType
  class OperationType < ::String
    DECRYPT = OperationType.new("DECRYPT")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}KeyManagementScheme
  #   dUKPT - KeyManagementScheme::DUKPT
  class KeyManagementScheme
    include ROXML
    # inner class for member: DUKPT
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}DUKPT
    #   operation - OperationType
    #   mode - KeyManagementScheme::DUKPT::Mode
    #   deviceInfo - KeyManagementScheme::DUKPT::DeviceInfo
    #   encryptedData - KeyManagementScheme::DUKPT::EncryptedData
    class DUKPT
      include ROXML
      # inner class for member: Mode
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}Mode
      #   pIN - SOAP::SOAPString
      #   data - SOAP::SOAPString
      class Mode
        include ROXML
        xml_accessor :PIN
        xml_accessor :Data

        def initialize(pIN = nil, data = nil)
          @pIN = pIN
          @data = data
        end
      end

      # inner class for member: DeviceInfo
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}DeviceInfo
      #   description - SOAP::SOAPString
      class DeviceInfo
        include ROXML
        xml_accessor :Description

        def initialize(description = nil)
          @description = description
        end
      end

      # inner class for member: EncryptedData
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}EncryptedData
      #   value - SOAP::SOAPString
      class EncryptedData
        include ROXML
        xml_accessor :Value

        def initialize(value = nil)
          @value = value
        end
      end

      xml_accessor :Operation
      xml_accessor :Mode, as: Mode
      xml_accessor :DeviceInfo, as: DeviceInfo
      xml_accessor :EncryptedData, as: EncryptedData

      def initialize(operation = nil, mode = nil, deviceInfo = nil, encryptedData = nil)
        @operation = operation
        @mode = mode
        @deviceInfo = deviceInfo
        @encryptedData = encryptedData
      end
    end

    xml_accessor :DUKPT, as: DUKPT

    def initialize(dUKPT = nil)
      @dUKPT = dUKPT
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}EncryptionAlgorithmType
  class EncryptionAlgorithmType < ::String
    AES = EncryptionAlgorithmType.new("AES")
    RSA = EncryptionAlgorithmType.new("RSA")
    TDES = EncryptionAlgorithmType.new("TDES")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}EncodingType
  class EncodingType < ::String
    Base64 = EncodingType.new("Base64")
    Hex = EncodingType.new("Hex")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}KeyValue
  #   encoding - EncodingType
  #   encryptionAlgorithm - EncryptionAlgorithmType
  #   scheme - KeyManagementScheme
  class KeyValue
    include ROXML
    xml_accessor :Encoding
    xml_accessor :EncryptionAlgorithm
    xml_accessor :Scheme, as: KeyManagementScheme

    def initialize(encoding = nil, encryptionAlgorithm = nil, scheme = nil)
      @encoding = encoding
      @encryptionAlgorithm = encryptionAlgorithm
      @scheme = scheme
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}KeyBlock
  #   value - KeyValue
  class KeyBlock
    include ROXML
    xml_accessor :Value, as: KeyValue

    def initialize(value = nil)
      @value = value
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}encryptedTrackDataType
  #   formOfPayment - KeyBlock
  class EncryptedTrackDataType
    include ROXML
    xml_accessor :FormOfPayment, as: KeyBlock

    def initialize(formOfPayment = nil)
      @formOfPayment = formOfPayment
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}payPalType
  #   successUrl - SOAP::SOAPString
  #   cancelUrl - SOAP::SOAPString
  #   paypalLc - SOAP::SOAPString
  #   paypalHdrImg - SOAP::SOAPString
  #   paypalPayflowcolor - SOAP::SOAPString
  #   payerID - SOAP::SOAPString
  class PayPalType
    include ROXML
    xml_accessor :successUrl
    xml_accessor :cancelUrl
    xml_accessor :paypalLc
    xml_accessor :paypalHdrImg
    xml_accessor :paypalPayflowcolor
    xml_accessor :payerID

    def initialize(successUrl = nil, cancelUrl = nil, paypalLc = nil, paypalHdrImg = nil, paypalPayflowcolor = nil, payerID = nil)
      @successUrl = successUrl
      @cancelUrl = cancelUrl
      @paypalLc = paypalLc
      @paypalHdrImg = paypalHdrImg
      @paypalPayflowcolor = paypalPayflowcolor
      @payerID = payerID
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentType
  #   creditCard - CreditCardType
  #   bankAccount - BankAccountType
  #   trackData - CreditCardTrackType
  #   encryptedTrackData - EncryptedTrackDataType
  #   payPal - PayPalType
  #   opaqueData - OpaqueDataType
  #   emv - PaymentEmvType
  #   dataSource - SOAP::SOAPString
  class PaymentType
    include ROXML
    xml_accessor :creditCard, as: CreditCardType
    xml_accessor :bankAccount, as: BankAccountType
    xml_accessor :trackData, as: CreditCardTrackType
    xml_accessor :encryptedTrackData, as: EncryptedTrackDataType
    xml_accessor :payPal, as: PayPalType
    xml_accessor :opaqueData, as: OpaqueDataType
    xml_accessor :emv, as: PaymentEmvType
    xml_accessor :dataSource

    def initialize(creditCard = nil, bankAccount = nil, trackData = nil, encryptedTrackData = nil, payPal = nil, opaqueData = nil, emv = nil, dataSource = nil)
      @creditCard = creditCard
      @bankAccount = bankAccount
      @trackData = trackData
      @encryptedTrackData = encryptedTrackData
      @payPal = payPal
      @opaqueData = opaqueData
      @emv = emv
      @dataSource = dataSource
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentMaskedType
  #   creditCard - CreditCardMaskedType
  #   bankAccount - BankAccountMaskedType
  #   tokenInformation - TokenMaskedType
  class PaymentMaskedType
    include ROXML
    xml_accessor :creditCard, as: CreditCardMaskedType
    xml_accessor :bankAccount, as: BankAccountMaskedType
    xml_accessor :tokenInformation

    def initialize(creditCard = nil, bankAccount = nil, tokenInformation = nil)
      @creditCard = creditCard
      @bankAccount = bankAccount
      @tokenInformation = tokenInformation
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}tokenMaskedType
  #   tokenSource - SOAP::SOAPString
  #   tokenNumber - SOAP::SOAPString
  #   expirationDate - SOAP::SOAPString
  #   tokenRequestorId - SOAP::SOAPString
  class TokenMaskedType
    include ROXML
    xml_accessor :tokenSource
    xml_accessor :tokenNumber
    xml_accessor :expirationDate
    xml_accessor :tokenRequestorId

    def initialize(tokenSource = nil, tokenNumber = nil, expirationDate = nil, tokenRequestorId = nil)
      @tokenSource = tokenSource
      @tokenNumber = tokenNumber
      @expirationDate = expirationDate
      @tokenRequestorId = tokenRequestorId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}orderType
  #   invoiceNumber - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   discountAmount - SOAP::SOAPDecimal
  #   taxIsAfterDiscount - SOAP::SOAPBoolean
  #   totalTaxTypeCode - SOAP::SOAPString
  #   purchaserVATRegistrationNumber - SOAP::SOAPString
  #   merchantVATRegistrationNumber - SOAP::SOAPString
  #   vatInvoiceReferenceNumber - SOAP::SOAPString
  #   purchaserCode - SOAP::SOAPString
  #   summaryCommodityCode - SOAP::SOAPString
  #   purchaseOrderDateUTC - SOAP::SOAPDate
  #   supplierOrderReference - SOAP::SOAPString
  #   authorizedContactName - SOAP::SOAPString
  #   cardAcceptorRefNumber - SOAP::SOAPString
  #   amexDataTAA1 - SOAP::SOAPString
  #   amexDataTAA2 - SOAP::SOAPString
  #   amexDataTAA3 - SOAP::SOAPString
  #   amexDataTAA4 - SOAP::SOAPString
   class OrderType
    include ROXML
    xml_accessor :invoiceNumber
    xml_accessor :description
    xml_accessor :discountAmount, as: BigDecimal
    xml_accessor :taxIsAfterDiscount
    xml_accessor :totalTaxTypeCode
    xml_accessor :purchaserVATRegistrationNumber
    xml_accessor :merchantVATRegistrationNumber
    xml_accessor :vatInvoiceReferenceNumber
    xml_accessor :purchaserCode
    xml_accessor :summaryCommodityCode
    xml_accessor :purchaseOrderDateUTC, from: 'date'
    xml_accessor :supplierOrderReference
    xml_accessor :authorizedContactName
    xml_accessor :cardAcceptorRefNumber
    xml_accessor :amexDataTAA1
    xml_accessor :amexDataTAA2
    xml_accessor :amexDataTAA3
    xml_accessor :amexDataTAA4
    def initialize(invoiceNumber = nil, description = nil, discountAmount = nil, taxIsAfterDiscount = nil, totalTaxTypeCode = nil, purchaserVATRegistrationNumber = nil, merchantVATRegistrationNumber = nil, vatInvoiceReferenceNumber = nil, purchaserCode = nil, summaryCommodityCode = nil, purchaseOrderDateUTC = nil, supplierOrderReference = nil, authorizedContactName = nil, cardAcceptorRefNumber = nil, amexDataTAA1 = nil, amexDataTAA2 = nil, amexDataTAA3 = nil, amexDataTAA4 = nil)
      @invoiceNumber = invoiceNumber
      @description = description
      @discountAmount = discountAmount
      @taxIsAfterDiscount = taxIsAfterDiscount
      @totalTaxTypeCode = totalTaxTypeCode
      @purchaserVATRegistrationNumber = purchaserVATRegistrationNumber
      @merchantVATRegistrationNumber = merchantVATRegistrationNumber
      @vatInvoiceReferenceNumber = vatInvoiceReferenceNumber
      @purchaserCode = purchaserCode
      @summaryCommodityCode = summaryCommodityCode
      @purchaseOrderDateUTC = purchaseOrderDateUTC
      @supplierOrderReference = supplierOrderReference
      @authorizedContactName = authorizedContactName
      @cardAcceptorRefNumber = cardAcceptorRefNumber
      @amexDataTAA1 = amexDataTAA1
      @amexDataTAA2 = amexDataTAA2
      @amexDataTAA3 = amexDataTAA3
      @amexDataTAA4 = amexDataTAA4
      
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}orderExType
  #   invoiceNumber - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   purchaseOrderNumber - SOAP::SOAPString
  class OrderExType
    include ROXML
    xml_accessor :invoiceNumber
    xml_accessor :description
    xml_accessor :purchaseOrderNumber

    def initialize(invoiceNumber = nil, description = nil, purchaseOrderNumber = nil)
      @invoiceNumber = invoiceNumber
      @description = description
      @purchaseOrderNumber = purchaseOrderNumber
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerType
  #   type - CustomerTypeEnum
  #   id - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   phoneNumber - SOAP::SOAPString
  #   faxNumber - SOAP::SOAPString
  #   driversLicense - DriversLicenseType
  #   taxId - SOAP::SOAPString
  class CustomerType
    include ROXML
    xml_accessor :type
    xml_accessor :id
    xml_accessor :email
    xml_accessor :phoneNumber
    xml_accessor :faxNumber
    xml_accessor :driversLicense
    xml_accessor :taxId

    def initialize(type = nil, id = nil, email = nil, phoneNumber = nil, faxNumber = nil, driversLicense = nil, taxId = nil)
      @type = type
      @id = id
      @email = email
      @phoneNumber = phoneNumber
      @faxNumber = faxNumber
      @driversLicense = driversLicense
      @taxId = taxId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerDataType
  #   type - CustomerTypeEnum
  #   id - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   driversLicense - DriversLicenseType
  #   taxId - SOAP::SOAPString
  class CustomerDataType
    include ROXML
    xml_accessor :type
    xml_accessor :id
    xml_accessor :email
    xml_accessor :driversLicense, as: DriversLicenseType
    xml_accessor :taxId

    def initialize(type = nil, id = nil, email = nil, driversLicense = nil, taxId = nil)
      @type = type
      @id = id
      @email = email
      @driversLicense = driversLicense
      @taxId = taxId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}impersonationAuthenticationType
  #   partnerLoginId - SOAP::SOAPString
  #   partnerTransactionKey - SOAP::SOAPString
  class ImpersonationAuthenticationType
    include ROXML
    xml_accessor :partnerLoginId
    xml_accessor :partnerTransactionKey

    def initialize(partnerLoginId = nil, partnerTransactionKey = nil)
      @partnerLoginId = partnerLoginId
      @partnerTransactionKey = partnerTransactionKey
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}fingerPrintType
  #   hashValue - SOAP::SOAPString
  #   sequence - SOAP::SOAPString
  #   timestamp - SOAP::SOAPString
  #   currencyCode - SOAP::SOAPString
  #   amount - SOAP::SOAPString
  class FingerPrintType
    include ROXML
    xml_accessor :hashValue
    xml_accessor :sequence
    xml_accessor :timestamp
    xml_accessor :currencyCode
    xml_accessor :amount

    def initialize(hashValue = nil, sequence = nil, timestamp = nil, currencyCode = nil, amount = nil)
      @hashValue = hashValue
      @sequence = sequence
      @timestamp = timestamp
      @currencyCode = currencyCode
      @amount = amount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}merchantAuthenticationType
  #   name - SOAP::SOAPString
  #   transactionKey - SOAP::SOAPString
  #   sessionToken - SOAP::SOAPString
  #   password - SOAP::SOAPString
  #   impersonationAuthentication - ImpersonationAuthenticationType
  #   fingerPrint - FingerPrintType
  #   mobileDeviceId - SOAP::SOAPString
  #   accessToken - SOAP::SOAPString
  class MerchantAuthenticationType
    include ROXML
    xml_accessor :name
    xml_accessor :transactionKey
    xml_accessor :sessionToken
    xml_accessor :password
    xml_accessor :impersonationAuthentication, as: ImpersonationAuthenticationType
    xml_accessor :fingerPrint, as: FingerPrintType
    xml_accessor :mobileDeviceId
    xml_accessor :accessToken

    def initialize(name = nil, transactionKey = nil, sessionToken = nil, password = nil, impersonationAuthentication = nil, fingerPrint = nil, mobileDeviceId = nil, accessToken = nil)
      @name = name
      @transactionKey = transactionKey
      @sessionToken = sessionToken
      @password = password
      @impersonationAuthentication = impersonationAuthentication
      @fingerPrint = fingerPrint
      @mobileDeviceId = mobileDeviceId
      @accessToken = accessToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}cardArt
  #   cardBrand - SOAP::SOAPString
  #   cardImageHeight - SOAP::SOAPString
  #   cardImageUrl - SOAP::SOAPString
  #   cardImageWidth - SOAP::SOAPString
  #   cardType - SOAP::SOAPString
  class CardArt
    include ROXML
    xml_accessor :cardBrand
    xml_accessor :cardImageHeight
    xml_accessor :cardImageUrl
    xml_accessor :cardImageWidth
    xml_accessor :cardType

    def initialize(cardBrand = nil, cardImageHeight = nil, cardImageUrl = nil, cardImageWidth = nil, cardType = nil)
      @cardBrand = cardBrand
      @cardImageHeight = cardImageHeight
      @cardImageUrl = cardImageUrl
      @cardImageWidth = cardImageWidth
      @cardType = cardType
    end
  end
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentDetails
  #   currency - SOAP::SOAPString
  #   promoCode - SOAP::SOAPString
  #   misc - SOAP::SOAPString
  #   giftWrap - SOAP::SOAPString
  #   discount - SOAP::SOAPString
  #   tax - SOAP::SOAPString
  #   shippingHandling - SOAP::SOAPString
  #   subTotal - SOAP::SOAPString
  #   orderID - SOAP::SOAPString
  #   amount - SOAP::SOAPString
  class PaymentDetails
    include ROXML
    xml_accessor :currency
    xml_accessor :promoCode
    xml_accessor :misc
    xml_accessor :giftWrap
    xml_accessor :discount
    xml_accessor :tax
    xml_accessor :shippingHandling
    xml_accessor :subTotal
    xml_accessor :orderID
    xml_accessor :amount

    def initialize(currency = nil, promoCode = nil, misc = nil, giftWrap = nil, discount = nil, tax = nil, shippingHandling = nil, subTotal = nil, orderID = nil, amount = nil)
      @currency = currency
      @promoCode = promoCode
      @misc = misc
      @giftWrap = giftWrap
      @discount = discount
      @tax = tax
      @shippingHandling = shippingHandling
      @subTotal = subTotal
      @orderID = orderID
      @amount = amount
    end
  end
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentScheduleType
  #   interval - PaymentScheduleType::Interval
  #   startDate - SOAP::SOAPDate
  #   totalOccurrences - SOAP::SOAPShort
  #   trialOccurrences - SOAP::SOAPShort
  class PaymentScheduleType
    include ROXML

    # inner class for member: interval
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}interval
    #   length - SOAP::SOAPShort
    #   unit - ARBSubscriptionUnitEnum
    class Interval
      include ROXML
      xml_accessor :length
      xml_accessor :unit

      def initialize(length = nil, unit = nil)
        @length = length
        @unit = unit
      end
    end

    xml_accessor :interval, as: Interval
    xml_accessor :startDate
    xml_accessor :totalOccurrences
    xml_accessor :trialOccurrences

    def initialize(interval = nil, startDate = nil, totalOccurrences = nil, trialOccurrences = nil)
      @interval = interval
      @startDate = startDate
      @totalOccurrences = totalOccurrences
      @trialOccurrences = trialOccurrences
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileIdType
  #   customerProfileId - SOAP::SOAPString
  #   customerPaymentProfileId - SOAP::SOAPString
  #   customerAddressId - SOAP::SOAPString
  class CustomerProfileIdType
    include ROXML
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerAddressId

    def initialize(customerProfileId = nil, customerPaymentProfileId = nil, customerAddressId = nil)
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerAddressId = customerAddressId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBSubscriptionType
  #   name - SOAP::SOAPString
  #   paymentSchedule - PaymentScheduleType
  #   amount - SOAP::SOAPDecimal
  #   trialAmount - SOAP::SOAPDecimal
  #   payment - PaymentType
  #   order - OrderType
  #   customer - CustomerType
  #   billTo - NameAndAddressType
  #   shipTo - NameAndAddressType
  #   profile - CustomerProfileIdType
  class ARBSubscriptionType
    include ROXML
    xml_accessor :name
    xml_accessor :paymentSchedule, as: PaymentScheduleType
    xml_accessor :amount
    xml_accessor :trialAmount
    xml_accessor :payment, as: PaymentType
    xml_accessor :order, as: OrderType
    xml_accessor :customer, as: CustomerType
    xml_accessor :billTo, as: NameAndAddressType
    xml_accessor :shipTo, as: NameAndAddressType
    xml_accessor :profile, as: CustomerProfileIdType

    def initialize(name = nil, paymentSchedule = nil, amount = nil, trialAmount = nil, payment = nil, order = nil, customer = nil, billTo = nil, shipTo = nil, profile = nil)
      @name = name
      @paymentSchedule = paymentSchedule
      @amount = amount
      @trialAmount = trialAmount
      @payment = payment
      @order = order
      @customer = customer
      @billTo = billTo
      @shipTo = shipTo
      @profile = profile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}subscriptionPaymentType
  #   id - SOAP::SOAPInt
  #   payNum - SOAP::SOAPInt
  class SubscriptionPaymentType
    include ROXML
    xml_accessor :id
    xml_accessor :payNum

    def initialize(id = nil, payNum = nil)
      @id = id
      @payNum = payNum
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}mobileDeviceType
  #   mobileDeviceId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   phoneNumber - SOAP::SOAPString
  #   devicePlatform - SOAP::SOAPString
  #   deviceActivation - DeviceActivationEnum
  class MobileDeviceType
    include ROXML
    xml_accessor :mobileDeviceId
    xml_accessor :description
    xml_accessor :phoneNumber
    xml_accessor :devicePlatform
    xml_accessor :deviceActivation

    def initialize(mobileDeviceId = nil, description = nil, phoneNumber = nil, devicePlatform = nil, deviceActivation = nil)
      @mobileDeviceId = mobileDeviceId
      @description = description
      @phoneNumber = phoneNumber
      @devicePlatform = devicePlatform
      @deviceActivation = deviceActivation
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}subMerchantType
  #   identifier - SOAP::SOAPString
  #   doingBusinessAs - SOAP::SOAPString
  #   paymentServiceProviderName - SOAP::SOAPString
  #   paymentServiceFacilitator - SOAP::SOAPString
  #   streetAddress - SOAP::SOAPString
  class SubMerchantType
    include ROXML
    xml_accessor :identifier
    xml_accessor :doingBusinessAs
    xml_accessor :paymentServiceProviderName
    xml_accessor :paymentServiceFacilitator
    xml_accessor :streetAddress
    xml_accessor :phone
    xml_accessor :email
    xml_accessor :postalCode
    xml_accessor :city
    xml_accessor :regionCode
    xml_accessor :countryCode

    def initialize(identifier = nil, doingBusinessAs = nil, paymentServiceProviderName = nil, paymentServiceFacilitator = nil, streetAddress = nil, phone = nil, email = nil, postalCode = nil, city = nil, regionCode = nil, countryCode = nil)
      @identifier = identifier
      @doingBusinessAs = doingBusinessAs
      @paymentServiceProviderName = paymentServiceProviderName
      @paymentServiceFacilitator = paymentServiceFacilitator
      @streetAddress = streetAddress
      @phone = phone
      @email = email
      @postalCode = postalCode
      @city = city
      @regionCode = regionCode
      @countryCode = countryCode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}settingType
  #   settingName - SOAP::SOAPString
  #   settingValue - SOAP::SOAPString
  class SettingType
    include ROXML
    xml_accessor :settingName
    xml_accessor :settingValue

    def initialize(settingName = nil, settingValue = nil)
      @settingName = settingName
      @settingValue = settingValue
    end
  end

  class Settings
    include ROXML
    xml_accessor :settings, as: [SettingType]
    def initialize(settings = [])
      @settings = settings
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}permissionType
  #   permissionName - SOAP::SOAPString
  class PermissionType
    include ROXML
    xml_accessor :permissionName

    def initialize(permissionName = nil)
      @permissionName = permissionName
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}userField
  #   name - SOAP::SOAPString
  #   value - SOAP::SOAPString
  class UserField
    include ROXML
    xml_accessor :name
    xml_accessor :value

    def initialize(name = nil, value = nil)
      @name = name
      @value = value
    end
  end

  class UserFields
    include ROXML
    xml_accessor :userFields, as: [UserField]

    def initialize(userFields = [])
      @userFields = userFields
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileBaseType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  class CustomerPaymentProfileBaseType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo

    def initialize(customerType = nil, billTo = nil)
      @customerType = customerType
      @billTo = billTo
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransAmountType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  class ProfileTransAmountType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [])
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}merchantInitTransReasonEnum
  class MerchantInitTransReasonEnum < ::String
    resubmission = MerchantInitTransReasonEnum.new("resubmission")
    delayedCharge = MerchantInitTransReasonEnum.new("delayedCharge")
    reauthorization = MerchantInitTransReasonEnum.new("reauthorization")
    noShow = MerchantInitTransReasonEnum.new("noShow")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}extendedAmountType
  #   amount - SOAP::SOAPDecimal
  #   name - SOAP::SOAPString
  #   description - SOAP::SOAPString
  class ExtendedAmountType
    include ROXML
    xml_accessor :amount, as: BigDecimal
    xml_accessor :name
    xml_accessor :description

    def initialize(amount = nil, name = nil, description = nil)
      @amount = amount
      @name = name
      @description = description
    end
  end

  #{AnetApi/xml/v1/schema/AnetApiSchema.xsd}subsequentAuthInformation
  #     originalNetworkTransId - SOAP::SOAPString
  #     originalAuthAmount - SOAP::SOAPDecimal
  #     reason - MerchantInitTransReasonEnum 
  class SubsequentAuthInformation
    include ROXML
    xml_accessor :originalNetworkTransId
	xml_accessor :originalAuthAmount
    xml_accessor :reason #, as: MerchantInitTransReasonEnum 
    
    def initialize(originalNetworkTransId = nil, originalAuthAmount = nil, reason = nil)
      @originalNetworkTransId = originalNetworkTransId
      @reason = reason
      @originalAuthAmount = originalAuthAmount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  #   payment - PaymentType
  #   driversLicense - DriversLicenseType
  #   taxId - SOAP::SOAPString
  #   defaultPaymentProfile - SOAP::SOAPBoolean
  #   subsequentAuthInformation - SubsequentAuthInformation
  class CustomerPaymentProfileType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo, as: CustomerAddressType
    xml_accessor :payment, as: PaymentType
    xml_accessor :driversLicense, as: DriversLicenseType
    xml_accessor :taxId
    xml_accessor :defaultPaymentProfile
	xml_accessor :subsequentAuthInformation, as: SubsequentAuthInformation

    def initialize(customerType = nil, billTo = nil, payment = nil, driversLicense = nil, taxId = nil, defaultPaymentProfile = nil, subsequentAuthInformation = nil)
      @customerType = customerType
      @billTo = billTo
      @payment = payment
      @driversLicense = driversLicense
      @taxId = taxId
      @defaultPaymentProfile = defaultPaymentProfile
	  @subsequentAuthInformation = subsequentAuthInformation
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileExType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  #   payment - PaymentType
  #   driversLicense - DriversLicenseType
  #   taxId - SOAP::SOAPString
  #   defaultPaymentProfile - SOAP::SOAPBoolean
  #   subsequentAuthInformation - SubsequentAuthInformation
  #   customerPaymentProfileId - (any)
  class CustomerPaymentProfileExType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo, as: CustomerAddressType
    xml_accessor :payment, as: PaymentType
    xml_accessor :driversLicense, as: DriversLicenseType
    xml_accessor :taxId
    xml_accessor :defaultPaymentProfile
    xml_accessor :subsequentAuthInformation, as: SubsequentAuthInformation
    xml_accessor :customerPaymentProfileId

    def initialize(customerType = nil, billTo = nil, payment = nil, driversLicense = nil, taxId = nil, defaultPaymentProfile = nil, subsequentAuthInformation = nil, customerPaymentProfileId = nil)
      @customerType = customerType
      @billTo = billTo
      @payment = payment
      @driversLicense = driversLicense
      @taxId = taxId
      @defaultPaymentProfile = defaultPaymentProfile
      @subsequentAuthInformation = subsequentAuthInformation
      @customerPaymentProfileId = customerPaymentProfileId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}SubscriptionIdList
  #   subscriptionId - SubscriptionIdList
  class SubscriptionIdList
    include ROXML
    xml_accessor :subscriptionId, as: []

    def initialize(subscriptionId = nil)
      @subscriptionId = subscriptionId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileMaskedType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   payment - PaymentMaskedType
  #   driversLicense - DriversLicenseMaskedType
  #   taxId - SOAP::SOAPString
  #   subscriptionIds - SubscriptionIdList
  class CustomerPaymentProfileMaskedType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo, as: CustomerAddressType
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :defaultPaymentProfile
    xml_accessor :payment, as: PaymentMaskedType
    xml_accessor :driversLicense, as: DriversLicenseMaskedType
    xml_accessor :taxId
    xml_accessor :subscriptionIds, as: SubscriptionIdList
	xml_accessor :originalNetworkTransId
	xml_accessor :originalAuthAmount

    def initialize(customerType = nil, billTo = nil, customerProfileId = nil, customerPaymentProfileId = nil, payment = nil, driversLicense = nil, taxId = nil, subscriptionIds = nil, defaultPaymentProfile = nil, originalNetworkTransId = nil, originalAuthAmount = nil)
      @customerType = customerType
      @billTo = billTo
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @payment = payment
      @driversLicense = driversLicense
      @taxId = taxId
      @subscriptionIds = subscriptionIds
      @defaultPaymentProfile = defaultPaymentProfile
	  @originalAuthAmount = originalAuthAmount
	  @originalNetworkTransId = originalNetworkTransId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileBaseType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  class CustomerProfileBaseType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email

    def initialize(merchantCustomerId = nil, description = nil, email = nil)
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   paymentProfiles - CustomerPaymentProfileType
  #   shipToList - CustomerAddressType
  #   profileType - CustomerProfileTypeEnum
  class CustomerProfileType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :paymentProfiles, from: 'paymentProfiles', as: [CustomerPaymentProfileType]
    xml_accessor :shipToList, from: 'shipToList', as: [CustomerAddressType]
    xml_accessor :profileType

    def initialize(merchantCustomerId = nil, description = nil, email = nil, paymentProfiles = [], shipToList = [], profileType = nil)
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @paymentProfiles = paymentProfiles
      @shipToList = shipToList
      @profileType = profileType
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileExType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerProfileId - (any)
  class CustomerProfileExType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :customerProfileId

    def initialize(merchantCustomerId = nil, description = nil, email = nil, customerProfileId = nil)
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @customerProfileId = customerProfileId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileInfoExType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerProfileId - (any)
  #   profileType - CustomerProfileTypeEnum
  class CustomerProfileInfoExType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :customerProfileId
    xml_accessor :profileType

    def initialize(merchantCustomerId = nil, description = nil, email = nil, customerProfileId = nil, profileType = nil)
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @customerProfileId = customerProfileId
      @profileType = profileType
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileMaskedType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerProfileId - (any)
  #   paymentProfiles - CustomerPaymentProfileMaskedType
  #   shipToList - CustomerAddressExType
  #   profileType - CustomerProfileTypeEnum
  class CustomerProfileMaskedType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :customerProfileId
    xml_accessor :paymentProfiles, from: 'paymentProfiles', as: [CustomerPaymentProfileMaskedType]
    xml_accessor :shipToList, from: 'shipToList', as: [CustomerAddressExType]
    xml_accessor :profileType

    def initialize(merchantCustomerId = nil, description = nil, email = nil, customerProfileId = nil, paymentProfiles = [], shipToList = [], profileType = nil)
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @customerProfileId = customerProfileId
      @paymentProfiles = paymentProfiles
      @shipToList = shipToList
      @profileType = profileType
    end
  end
  

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}lineItemType
  #   itemId - SOAP::SOAPString
  #   name - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   quantity - SOAP::SOAPDecimal
  #   unitPrice - SOAP::SOAPDecimal
  #   taxable - SOAP::SOAPBoolean
  #   unitOfMeasure - SOAP::SOAPString
  #   typeOfSupply - SOAP::SOAPString
  #   taxRate - SOAP::SOAPDecimal
  #   taxAmount - SOAP::SOAPDecimal
  #   nationalTax - SOAP::SOAPDecimal
  #   localTax - SOAP::SOAPDecimal
  #   vatRate - SOAP::SOAPDecimal
  #   alternateTaxId - SOAP::SOAPString
  #   alternateTaxType - SOAP::SOAPString
  #   alternateTaxTypeApplied - SOAP::SOAPString
  #   alternateTaxRate - SOAP::SOAPDecimal
  #   alternateTaxAmount - SOAP::SOAPDecimal
  #   totalAmount - SOAP::SOAPDecimal
  #   commodityCode - SOAP::SOAPString
  #   productCode - SOAP::SOAPString
  #   productSKU - SOAP::SOAPString
  #   discountRate - SOAP::SOAPDecimal
  #   discountAmount - SOAP::SOAPDecimal
  #   taxIncludedInTotal - SOAP::SOAPBoolean
  #   taxIsAfterDiscount - SOAP::SOAPBoolean
  class LineItemType
    include ROXML
    xml_accessor :itemId
    xml_accessor :name
    xml_accessor :description
    xml_accessor :quantity, as: BigDecimal
    xml_accessor :unitPrice, as: BigDecimal
    xml_accessor :taxable
    xml_accessor :unitOfMeasure
    xml_accessor :typeOfSupply
    xml_accessor :taxRate, as: BigDecimal
    xml_accessor :taxAmount, as: BigDecimal
    xml_accessor :nationalTax, as: BigDecimal
    xml_accessor :localTax, as: BigDecimal
    xml_accessor :vatRate, as: BigDecimal
    xml_accessor :alternateTaxId
    xml_accessor :alternateTaxType
    xml_accessor :alternateTaxTypeApplied
    xml_accessor :alternateTaxRate, as: BigDecimal
    xml_accessor :alternateTaxAmount, as: BigDecimal
    xml_accessor :totalAmount, as: BigDecimal
    xml_accessor :commodityCode
    xml_accessor :productCode
    xml_accessor :productSKU
    xml_accessor :discountRate, as: BigDecimal
    xml_accessor :discountAmount, as: BigDecimal
    xml_accessor :taxIncludedInTotal
    xml_accessor :taxIsAfterDiscount
    
    def initialize(itemId = nil, name = nil, description = nil, quantity = nil, unitPrice = nil, taxable = nil, unitOfMeasure = nil,typeOfSupply = nil, taxRate = nil, taxAmount = nil, nationalTax = nil, localTax = nil, vatRate = nil, alternateTaxId = nil, alternateTaxType = nil, alternateTaxTypeApplied = nil, alternateTaxRate = nil, alternateTaxAmount = nil, totalAmount = nil, commodityCode = nil, productCode = nil, productSKU = nil, discountRate = nil, discountAmount = nil, taxIncludedInTotal = nil, taxIsAfterDiscount = nil)
      @itemId = itemId
      @name = name
      @description = description
      @quantity = quantity
      @unitPrice = unitPrice
      @taxable = taxable
      @unitOfMeasure = unitOfMeasure
      @typeOfSupply = typeOfSupply
      @taxRate = taxRate
      @taxAmount = taxAmount
      @nationalTax = nationalTax
      @localTax = localTax
      @vatRate = vatRate
      @alternateTaxId = alternateTaxId
      @alternateTaxType = alternateTaxType
      @alternateTaxTypeApplied = alternateTaxTypeApplied
      @alternateTaxRate = alternateTaxRate
      @alternateTaxAmount = alternateTaxAmount
      @totalAmount = totalAmount
      @commodityCode = commodityCode
      @productCode = productCode
      @productSKU = productSKU
      @discountRate = discountRate
      @discountAmount = discountAmount
      @taxIncludedInTotal = taxIncludedInTotal
      @taxIsAfterDiscount = taxIsAfterDiscount
      
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfLineItem
  class LineItems
    include ROXML
    xml_accessor :lineItems, as: [LineItemType]

    def initialize(lineItems = [])
      @lineItems = lineItems
    end
  end

  #{AnetApi/xml/v1/schema/AnetApiSchema.xsd}processingOptions
  #     isFirstRecurringPayment - SOAP::SOAPBoolean
  #     isFirstSubsequentAuth - SOAP::SOAPBoolean
  #     isSubsequentAuth - SOAP::SOAPBoolean
  #     isStoredCredentials - SOAP::SOAPBoolean 
  class ProcessingOptions
    include ROXML
    xml_accessor :isFirstRecurringPayment
    xml_accessor :isFirstSubsequentAuth
    xml_accessor :isSubsequentAuth
    xml_accessor :isStoredCredentials
    
    def initialize(isFirstRecurringPayment = nil, isFirstSubsequentAuth = nil, isSubsequentAuth = nil, isStoredCredentials = nil)
      @isFirstRecurringPayment = isFirstRecurringPayment
      @isFirstSubsequentAuth = isFirstSubsequentAuth
      @isSubsequentAuth = isSubsequentAuth
      @isStoredCredentials = isStoredCredentials
            
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}authIndicatorEnum
  class AuthIndicatorEnum < ::String
    Pre = AuthIndicatorEnum.new("pre")
    Final = AuthIndicatorEnum.new("final")
  end
  
  #{AnetApi/xml/v1/schema/AnetApiSchema.xsd}authorizationIndicatorType
  #     authorizationIndicator - AuthIndicatorEnum
  class AuthorizationIndicatorType
    include ROXML
    xml_accessor :authorizationIndicator #, as: AuthIndicatorEnum
    
    def initialize(authorizationIndicator = nil)
      @authorizationIndicator = authorizationIndicator
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransOrderType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   order - OrderExType
  #   taxExempt - SOAP::SOAPBoolean
  #   recurringBilling - SOAP::SOAPBoolean
  #   cardCode - (any)
  #   splitTenderId - (any)
  #   processingOptions - ProcessingOptions
  #   subsequentAuthInformation - SubsequentAuthInformation
  class ProfileTransOrderType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :order
    xml_accessor :taxExempt
    xml_accessor :recurringBilling
    xml_accessor :cardCode
    xml_accessor :splitTenderId
    xml_accessor :processingOptions
    xml_accessor :subsequentAuthInformation
	xml_accessor :authorizationIndicatorType

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [], customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, order = nil, taxExempt = nil, recurringBilling = nil, cardCode = nil, splitTenderId = nil, processingOptions = nil, subsequentAuthInformation = nil, authorizationIndicatorType = nil)
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @order = order
      @taxExempt = taxExempt
      @recurringBilling = recurringBilling
      @cardCode = cardCode
      @splitTenderId = splitTenderId
      @processingOptions = processingOptions
      @subsequentAuthInformation = subsequentAuthInformation
	  @authorizationIndicatorType = authorizationIndicatorType
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransAuthCaptureType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   order - OrderExType
  #   taxExempt - SOAP::SOAPBoolean
  #   recurringBilling - SOAP::SOAPBoolean
  #   cardCode - (any)
  #   splitTenderId - (any)
  class ProfileTransAuthCaptureType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :order
    xml_accessor :taxExempt
    xml_accessor :recurringBilling
    xml_accessor :cardCode
    xml_accessor :splitTenderId

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [], customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, order = nil, taxExempt = nil, recurringBilling = nil, cardCode = nil, splitTenderId = nil)
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @order = order
      @taxExempt = taxExempt
      @recurringBilling = recurringBilling
      @cardCode = cardCode
      @splitTenderId = splitTenderId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransAuthOnlyType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   order - OrderExType
  #   taxExempt - SOAP::SOAPBoolean
  #   recurringBilling - SOAP::SOAPBoolean
  #   cardCode - (any)
  #   splitTenderId - (any)
  class ProfileTransAuthOnlyType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :order
    xml_accessor :taxExempt
    xml_accessor :recurringBilling
    xml_accessor :cardCode
    xml_accessor :splitTenderId

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [], customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, order = nil, taxExempt = nil, recurringBilling = nil, cardCode = nil, splitTenderId = nil)
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @order = order
      @taxExempt = taxExempt
      @recurringBilling = recurringBilling
      @cardCode = cardCode
      @splitTenderId = splitTenderId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransCaptureOnlyType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   order - OrderExType
  #   taxExempt - SOAP::SOAPBoolean
  #   recurringBilling - SOAP::SOAPBoolean
  #   cardCode - (any)
  #   splitTenderId - (any)
  #   approvalCode - SOAP::SOAPString
  class ProfileTransCaptureOnlyType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :order
    xml_accessor :taxExempt
    xml_accessor :recurringBilling
    xml_accessor :cardCode
    xml_accessor :splitTenderId
    xml_accessor :approvalCode

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [], customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, order = nil, taxExempt = nil, recurringBilling = nil, cardCode = nil, splitTenderId = nil, approvalCode = nil)
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @order = order
      @taxExempt = taxExempt
      @recurringBilling = recurringBilling
      @cardCode = cardCode
      @splitTenderId = splitTenderId
      @approvalCode = approvalCode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransPriorAuthCaptureType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   transId - (any)
  class ProfileTransPriorAuthCaptureType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :transId

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [], customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, transId = nil)
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @transId = transId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransRefundType
  #   amount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - LineItemType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   creditCardNumberMasked - SOAP::SOAPString
  #   bankRoutingNumberMasked - SOAP::SOAPString
  #   bankAccountNumberMasked - SOAP::SOAPString
  #   order - OrderExType
  #   transId - (any)
  class ProfileTransRefundType
    include ROXML
    xml_accessor :amount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :creditCardNumberMasked
    xml_accessor :bankRoutingNumberMasked
    xml_accessor :bankAccountNumberMasked
    xml_accessor :order
    xml_accessor :transId

    def initialize(amount = nil, tax = nil, shipping = nil, duty = nil, lineItems = [], customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, creditCardNumberMasked = nil, bankRoutingNumberMasked = nil, bankAccountNumberMasked = nil, order = nil, transId = nil)
      @amount = amount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @creditCardNumberMasked = creditCardNumberMasked
      @bankRoutingNumberMasked = bankRoutingNumberMasked
      @bankAccountNumberMasked = bankAccountNumberMasked
      @order = order
      @transId = transId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransVoidType
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   transId - (any)
  class ProfileTransVoidType
    include ROXML
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :transId

    def initialize(customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, transId = nil)
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @transId = transId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}profileTransactionType
  #   profileTransAuthCapture - ProfileTransAuthCaptureType
  #   profileTransAuthOnly - ProfileTransAuthOnlyType
  #   profileTransPriorAuthCapture - ProfileTransPriorAuthCaptureType
  #   profileTransCaptureOnly - ProfileTransCaptureOnlyType
  #   profileTransRefund - ProfileTransRefundType
  #   profileTransVoid - ProfileTransVoidType
  class ProfileTransactionType
    include ROXML
    xml_accessor :profileTransAuthCapture
    xml_accessor :profileTransAuthOnly
    xml_accessor :profileTransPriorAuthCapture
    xml_accessor :profileTransCaptureOnly
    xml_accessor :profileTransRefund
    xml_accessor :profileTransVoid

    def initialize(profileTransAuthCapture = nil, profileTransAuthOnly = nil, profileTransPriorAuthCapture = nil, profileTransCaptureOnly = nil, profileTransRefund = nil, profileTransVoid = nil)
      @profileTransAuthCapture = profileTransAuthCapture
      @profileTransAuthOnly = profileTransAuthOnly
      @profileTransPriorAuthCapture = profileTransPriorAuthCapture
      @profileTransCaptureOnly = profileTransCaptureOnly
      @profileTransRefund = profileTransRefund
      @profileTransVoid = profileTransVoid
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfFraudFilterType
  class ArrayOfFraudFilterType < ::Array
    include ROXML
    xml_accessor :fraudFilter

    def initialize(fraudFilter = [])
      @fraudFilter = fraudFilter
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}FraudInformationType
  class FraudInformationType
    include ROXML
    xml_accessor :fraudFilterList, as: ArrayOfFraudFilterType
    xml_accessor :fraudAction

    def initialize(fraudFilterList = nil, fraudAction = nil)
      @fraudFilterList = fraudFilterList
      @fraudAction = fraudAction
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transactionSummaryType
  #   transId - (any)
  #   submitTimeUTC - SOAP::SOAPDateTime
  #   submitTimeLocal - SOAP::SOAPDateTime
  #   transactionStatus - SOAP::SOAPString
  #   invoiceNumber - SOAP::SOAPString
  #   firstName - SOAP::SOAPString
  #   lastName - SOAP::SOAPString
  #   accountType - SOAP::SOAPString
  #   accountNumber - SOAP::SOAPString
  #   settleAmount - SOAP::SOAPDecimal
  #   marketType - SOAP::SOAPString
  #   product - SOAP::SOAPString
  #   mobileDeviceId - SOAP::SOAPString
  #   subscription - SubscriptionPaymentType
  #   hasReturnedItems - SOAP::SOAPBoolean
  #   fraudInformation - FraudInformationType
  #   profile - CustomerProfileIdType
  class TransactionSummaryType
    include ROXML
    xml_accessor :transId
    xml_accessor :submitTimeUTC
    xml_accessor :submitTimeLocal
    xml_accessor :transactionStatus
    xml_accessor :invoiceNumber
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :accountType
    xml_accessor :accountNumber
    xml_accessor :settleAmount
    xml_accessor :marketType
    xml_accessor :product
    xml_accessor :mobileDeviceId
    xml_accessor :subscription, as: SubscriptionPaymentType
    xml_accessor :hasReturnedItems
    xml_accessor :fraudInformation
    xml_accessor :profile, as: CustomerProfileIdType

    def initialize(transId = nil, submitTimeUTC = nil, submitTimeLocal = nil, transactionStatus = nil, invoiceNumber = nil, firstName = nil, lastName = nil, accountType = nil, accountNumber = nil, settleAmount = nil, marketType = nil, product = nil, mobileDeviceId = nil, subscription = nil, hasReturnedItems = nil, fraudInformation = nil, profile = nil)
      @transId = transId
      @submitTimeUTC = submitTimeUTC
      @submitTimeLocal = submitTimeLocal
      @transactionStatus = transactionStatus
      @invoiceNumber = invoiceNumber
      @firstName = firstName
      @lastName = lastName
      @accountType = accountType
      @accountNumber = accountNumber
      @settleAmount = settleAmount
      @marketType = marketType
      @product = product
      @mobileDeviceId = mobileDeviceId
      @subscription = subscription
      @hasReturnedItems = hasReturnedItems
      @fraudInformation = fraudInformation
      @profile = profile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}arbTransaction
  #   transId - (any)
  #   response - SOAP::SOAPString
  #   submitTimeUTC - SOAP::SOAPDateTime
  #   payNum - SOAP::SOAPString
  class ArbTransaction
    include ROXML
    xml_accessor :transId
    xml_accessor :response
    xml_accessor :submitTimeUTC
    xml_accessor :payNum

    def initialize(transId = nil, response = nil, submitTimeUTC = nil, payNum = nil)
      @transId = transId
      @response = response
      @submitTimeUTC = submitTimeUTC
      @payNum = payNum
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfTransactionSummaryType
  class ArrayOfTransactionSummaryType < ::Array
    include ROXML
    xml_accessor :transaction, as: [TransactionSummaryType]

    def initialize(transaction = [])
      @transaction = transaction
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBTransactionList
  class ARBTransactionList < ::Array
    include ROXML
    xml_accessor :arbTransaction, as: [ArbTransaction]

    def initialize(arbTransaction = [])
      @arbTransaction = arbTransaction
    end
 end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}batchStatisticType
  #   accountType - SOAP::SOAPString
  #   chargeAmount - SOAP::SOAPDecimal
  #   chargeCount - SOAP::SOAPInt
  #   refundAmount - SOAP::SOAPDecimal
  #   refundCount - SOAP::SOAPInt
  #   voidCount - SOAP::SOAPInt
  #   declineCount - SOAP::SOAPInt
  #   errorCount - SOAP::SOAPInt
  #   returnedItemAmount - SOAP::SOAPDecimal
  #   returnedItemCount - SOAP::SOAPInt
  #   chargebackAmount - SOAP::SOAPDecimal
  #   chargebackCount - SOAP::SOAPInt
  #   correctionNoticeCount - SOAP::SOAPInt
  #   chargeChargeBackAmount - SOAP::SOAPDecimal
  #   chargeChargeBackCount - SOAP::SOAPInt
  #   refundChargeBackAmount - SOAP::SOAPDecimal
  #   refundChargeBackCount - SOAP::SOAPInt
  #   chargeReturnedItemsAmount - SOAP::SOAPDecimal
  #   chargeReturnedItemsCount - SOAP::SOAPInt
  #   refundReturnedItemsAmount - SOAP::SOAPDecimal
  #   refundReturnedItemsCount - SOAP::SOAPInt
  class BatchStatisticType
    include ROXML
    xml_accessor :accountType
    xml_accessor :chargeAmount
    xml_accessor :chargeCount
    xml_accessor :refundAmount
    xml_accessor :refundCount
    xml_accessor :voidCount
    xml_accessor :declineCount
    xml_accessor :errorCount
    xml_accessor :returnedItemAmount
    xml_accessor :returnedItemCount
    xml_accessor :chargebackAmount
    xml_accessor :chargebackCount
    xml_accessor :correctionNoticeCount
    xml_accessor :chargeChargeBackAmount
    xml_accessor :chargeChargeBackCount
    xml_accessor :refundChargeBackAmount
    xml_accessor :refundChargeBackCount
    xml_accessor :chargeReturnedItemsAmount
    xml_accessor :chargeReturnedItemsCount
    xml_accessor :refundReturnedItemsAmount
    xml_accessor :refundReturnedItemsCount

    def initialize(accountType = nil, chargeAmount = nil, chargeCount = nil, refundAmount = nil, refundCount = nil, voidCount = nil, declineCount = nil, errorCount = nil, returnedItemAmount = nil, returnedItemCount = nil, chargebackAmount = nil, chargebackCount = nil, correctionNoticeCount = nil, chargeChargeBackAmount = nil, chargeChargeBackCount = nil, refundChargeBackAmount = nil, refundChargeBackCount = nil, chargeReturnedItemsAmount = nil, chargeReturnedItemsCount = nil, refundReturnedItemsAmount = nil, refundReturnedItemsCount = nil)
      @accountType = accountType
      @chargeAmount = chargeAmount
      @chargeCount = chargeCount
      @refundAmount = refundAmount
      @refundCount = refundCount
      @voidCount = voidCount
      @declineCount = declineCount
      @errorCount = errorCount
      @returnedItemAmount = returnedItemAmount
      @returnedItemCount = returnedItemCount
      @chargebackAmount = chargebackAmount
      @chargebackCount = chargebackCount
      @correctionNoticeCount = correctionNoticeCount
      @chargeChargeBackAmount = chargeChargeBackAmount
      @chargeChargeBackCount = chargeChargeBackCount
      @refundChargeBackAmount = refundChargeBackAmount
      @refundChargeBackCount = refundChargeBackCount
      @chargeReturnedItemsAmount = chargeReturnedItemsAmount
      @chargeReturnedItemsCount = chargeReturnedItemsCount
      @refundReturnedItemsAmount = refundReturnedItemsAmount
      @refundReturnedItemsCount = refundReturnedItemsCount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}batchDetailsType
  #   batchId - (any)
  #   settlementTimeUTC - SOAP::SOAPDateTime
  #   settlementTimeLocal - SOAP::SOAPDateTime
  #   settlementState - SOAP::SOAPString
  #   paymentMethod - SOAP::SOAPString
  #   marketType - SOAP::SOAPString
  #   product - SOAP::SOAPString
  #   statistics - ArrayOfBatchStatisticType
  class BatchDetailsType
    include ROXML
    xml_accessor :batchId
    xml_accessor :settlementTimeUTC
    xml_accessor :settlementTimeLocal
    xml_accessor :settlementState
    xml_accessor :paymentMethod
    xml_accessor :marketType
    xml_accessor :product
    xml_accessor :statistics, as: [BatchStatisticType]

    def initialize(batchId = nil, settlementTimeUTC = nil, settlementTimeLocal = nil, settlementState = nil, paymentMethod = nil, marketType = nil, product = nil, statistics = nil)
      @batchId = batchId
      @settlementTimeUTC = settlementTimeUTC
      @settlementTimeLocal = settlementTimeLocal
      @settlementState = settlementState
      @paymentMethod = paymentMethod
      @marketType = marketType
      @product = product
      @statistics = statistics
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfBatchDetailsType
  class ArrayOfBatchDetailsType < ::Array
    include ROXML
    xml_accessor :batch, as: [BatchDetailsType]

    def initialize(batch = [])
      @batch = batch
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}returnedItemType
  #   id - (any)
  #   dateUTC - SOAP::SOAPDateTime
  #   dateLocal - SOAP::SOAPDateTime
  #   code - SOAP::SOAPString
  #   description - SOAP::SOAPString
  class ReturnedItemType
    include ROXML
    xml_accessor :id
    xml_accessor :dateUTC
    xml_accessor :dateLocal
    xml_accessor :code
    xml_accessor :description

    def initialize(id = nil, dateUTC = nil, dateLocal = nil, code = nil, description = nil)
      @id = id
      @dateUTC = dateUTC
      @dateLocal = dateLocal
      @code = code
      @description = description
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfReturnedItem
  class ArrayOfReturnedItem < ::Array
    include ROXML
    xml_accessor :returnedItem, as: [ReturnedItemType]
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}FDSFilterType
  #   name - SOAP::SOAPString
  #   action - SOAP::SOAPString
  class FDSFilterType
    include ROXML
    xml_accessor :name
    xml_accessor :action

    def initialize(name = nil, action = nil)
      @name = name
      @action = action
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}otherTaxType
  #     nationalTaxAmount - SOAP::SOAPDecimal
  #     localTaxAmount - SOAP::SOAPDecimal
  #     alternateTaxAmount - SOAP::SOAPDecimal
  #     alternateTaxId - SOAP::SOAPString 
  #     vatTaxRate - SOAP::SOAPDecimal
  #     vatTaxAmount - SOAP::SOAPDecimal
  class OtherTaxType
    include ROXML
    xml_accessor :nationalTaxAmount, as: BigDecimal
    xml_accessor :localTaxAmount, as: BigDecimal
    xml_accessor :alternateTaxAmount, as: BigDecimal
    xml_accessor :alternateTaxId
    xml_accessor :vatTaxRate, as: BigDecimal
    xml_accessor :vatTaxAmount, as: BigDecimal
    def initialize(nationalTaxAmount = nil, localTaxAmount = nil, alternateTaxAmount = nil, alternateTaxId = nil, vatTaxRate = nil, vatTaxAmount = nil)
      @nationalTaxAmount = nationalTaxAmount
      @localTaxAmount = localTaxAmount
      @alternateTaxAmount = alternateTaxAmount
      @alternateTaxId = alternateTaxId
      @vatTaxRate = vatTaxRate
      @vatTaxAmount = vatTaxAmount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transactionDetailsType
  #   transId - (any)
  #   refTransId - (any)
  #   splitTenderId - (any)
  #   submitTimeUTC - SOAP::SOAPDateTime
  #   submitTimeLocal - SOAP::SOAPDateTime
  #   transactionType - SOAP::SOAPString
  #   transactionStatus - SOAP::SOAPString
  #   responseCode - SOAP::SOAPInt
  #   responseReasonCode - SOAP::SOAPInt
  #   subscription - SubscriptionPaymentType
  #   responseReasonDescription - SOAP::SOAPString
  #   authCode - SOAP::SOAPString
  #   AVSResponse - SOAP::SOAPString
  #   cardCodeResponse - SOAP::SOAPString
  #   cAVVResponse - SOAP::SOAPString
  #   fDSFilterAction - SOAP::SOAPString
  #   fDSFilters - ArrayOfFDSFilter
  #   batch - BatchDetailsType
  #   order - OrderExType
  #   requestedAmount - SOAP::SOAPDecimal
  #   authAmount - SOAP::SOAPDecimal
  #   settleAmount - SOAP::SOAPDecimal
  #   tax - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   lineItems - ArrayOfLineItem
  #   prepaidBalanceRemaining - SOAP::SOAPDecimal
  #   taxExempt - SOAP::SOAPBoolean
  #   payment - PaymentMaskedType
  #   customer - CustomerDataType
  #   billTo - CustomerAddressType
  #   shipTo - NameAndAddressType
  #   recurringBilling - SOAP::SOAPBoolean
  #   customerIP - SOAP::SOAPString
  #   product - SOAP::SOAPString
  #   marketType - SOAP::SOAPString
  #   mobileDeviceId - SOAP::SOAPString
  #   returnedItems - ArrayOfReturnedItem
  #   solution - SolutionType
  #   emvDetails - TransactionDetailsType::EmvDetails
  #   profile - CustomerProfileIdType
  #   otherTax  - OtherTaxType
  #   shipFrom  - NameAndAddressType
  #   networkTransId - SOAP::SOAPString
  #   originalNetworkTransId - SOAP::SOAPString
  #   originalAuthAmount - SOAP::SOAPDecimal
  #   authorizationIndicator - SOAP::SOAPString
  class TransactionDetailsType
    include ROXML
    # inner class for member: EmvDetails
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}emvDetails
    #   tagId - SOAP::SOAPString
    #   data - SOAP::SOAPString
    class EmvDetails
      include ROXML
      class Tag
        include ROXML
        xml_accessor :tagId
        xml_accessor :data

        def initialize(tagId = nil, data = nil)
          @tagId = tagId
          @data = data
        end
      end
      xml_accessor :tag, as: Tag

      def initialize(tag = nil)
        @tag = tag
      end
    end
    xml_accessor :transId
    xml_accessor :refTransId
    xml_accessor :splitTenderId
    xml_accessor :submitTimeUTC
    xml_accessor :submitTimeLocal
    xml_accessor :transactionType
    xml_accessor :transactionStatus
    xml_accessor :responseCode
    xml_accessor :responseReasonCode
    xml_accessor :subscription, as: SubscriptionPaymentType
    xml_accessor :responseReasonDescription
    xml_accessor :authCode
    xml_accessor :AVSResponse
    xml_accessor :cardCodeResponse
    xml_accessor :cAVVResponse
    xml_accessor :fDSFilterAction
    xml_accessor :fDSFilters
    xml_accessor :batch, as: BatchDetailsType
    xml_accessor :order, as: OrderExType
    xml_accessor :requestedAmount
    xml_accessor :authAmount
    xml_accessor :settleAmount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :prepaidBalanceRemaining
    xml_accessor :taxExempt
    xml_accessor :payment, as: PaymentMaskedType
    xml_accessor :customer, as: CustomerDataType
    xml_accessor :billTo, as: CustomerAddressType
    xml_accessor :shipTo, as: NameAndAddressType
    xml_accessor :recurringBilling
    xml_accessor :customerIP
    xml_accessor :product
    xml_accessor :marketType
    xml_accessor :mobileDeviceId
    xml_accessor :returnedItems, as: ArrayOfReturnedItem
    xml_accessor :solution
    xml_accessor :emvDetails, as: EmvDetails
    xml_accessor :profile, as: CustomerProfileIdType
    xml_accessor :surcharge, as: ExtendedAmountType
    xml_accessor :employeeId
    xml_accessor :tip, as: ExtendedAmountType
    xml_accessor :otherTax, as: OtherTaxType 
    xml_accessor :shipFrom, as: NameAndAddressType
    xml_accessor :networkTransId
    xml_accessor :originalNetworkTransId
    xml_accessor :originalAuthAmount
    xml_accessor :authorizationIndicator

    def initialize(transId = nil, refTransId = nil, splitTenderId = nil, submitTimeUTC = nil, submitTimeLocal = nil, transactionType = nil, transactionStatus = nil, responseCode = nil, responseReasonCode = nil, subscription = nil, responseReasonDescription = nil, authCode = nil, aVSResponse = nil, cardCodeResponse = nil, cAVVResponse = nil, fDSFilterAction = nil, fDSFilters = nil, batch = nil, order = nil, requestedAmount = nil, authAmount = nil, settleAmount = nil, tax = nil, shipping = nil, duty = nil, lineItems = nil, prepaidBalanceRemaining = nil, taxExempt = nil, payment = nil, customer = nil, billTo = nil, shipTo = nil, recurringBilling = nil, customerIP = nil, product = nil, marketType = nil, mobileDeviceId = nil, returnedItems = nil, solution = nil, emvDetails = nil, profile = nil, surcharge = nil, employeeId = nil, tip = nil, otherTax= nil, shipFrom = nil, networkTransId = nil, originalNetworkTransId = nil, originalAuthAmount = nil, authorizationIndicator = nil)
      @transId = transId
      @refTransId = refTransId
      @splitTenderId = splitTenderId
      @submitTimeUTC = submitTimeUTC
      @submitTimeLocal = submitTimeLocal
      @transactionType = transactionType
      @transactionStatus = transactionStatus
      @responseCode = responseCode
      @responseReasonCode = responseReasonCode
      @subscription = subscription
      @responseReasonDescription = responseReasonDescription
      @authCode = authCode
      @AVSResponse = aVSResponse
      @cardCodeResponse = cardCodeResponse
      @cAVVResponse = cAVVResponse
      @fDSFilterAction = fDSFilterAction
      @fDSFilters = fDSFilters
      @batch = batch
      @order = order
      @requestedAmount = requestedAmount
      @authAmount = authAmount
      @settleAmount = settleAmount
      @tax = tax
      @shipping = shipping
      @duty = duty
      @lineItems = lineItems
      @prepaidBalanceRemaining = prepaidBalanceRemaining
      @taxExempt = taxExempt
      @payment = payment
      @customer = customer
      @billTo = billTo
      @shipTo = shipTo
      @recurringBilling = recurringBilling
      @customerIP = customerIP
      @product = product
      @marketType = marketType
      @mobileDeviceId = mobileDeviceId
      @returnedItems = returnedItems
      @solution = solution
      @emvDetails = emvDetails
      @profile = profile
      @surcharge = surcharge
      @employeeId = employeeId
      @tip = tip
      @otherTax = otherTax
      @shipFrom = shipFrom
      @networkTransId = networkTransId
      @originalNetworkTransId = originalNetworkTransId
      @originalAuthAmount = originalAuthAmount
      @authorizationIndicator = authorizationIndicator
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}solutionType
  #   id - SOAP::SOAPString
  #   name - SOAP::SOAPString
  class SolutionType
    include ROXML
    xml_accessor :id
    xml_accessor :name

    def initialize(id = nil, name = nil)
      @id = id
      @name = name
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}emvTag
  #   id - SOAP::SOAPString
  #   value - SOAP::SOAPString
  #   formatted - SOAP::SOAPString
  class EmvTag
    include ROXML
    xml_accessor :name
    xml_accessor :value
    xml_accessor :formatted

    def initialize(id = nil, value = nil, formatted = nil)
      @id = id
      @value = value
      @formatted = formatted
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transactionResponse
  #   responseCode - SOAP::SOAPString
  #   rawResponseCode - SOAP::SOAPString
  #   authCode - SOAP::SOAPString
  #   avsResultCode - SOAP::SOAPString
  #   cvvResultCode - SOAP::SOAPString
  #   cavvResultCode - SOAP::SOAPString
  #   transId - SOAP::SOAPString
  #   refTransID - SOAP::SOAPString
  #   transHash - SOAP::SOAPString
  #   testRequest - SOAP::SOAPString
  #   accountNumber - SOAP::SOAPString
  #   accountType - SOAP::SOAPString
  #   splitTenderId - SOAP::SOAPString
  #   prePaidCard - TransactionResponse::PrePaidCard
  #   messages - TransactionResponse::Messages
  #   errors - TransactionResponse::Errors
  #   splitTenderPayments - TransactionResponse::SplitTenderPayments
  #   userFields - TransactionResponse::UserFields
  #   shipTo - NameAndAddressType
  #   secureAcceptance - TransactionResponse::secureAcceptance
  #   emvResponse - TransactionResponse::emvResponse
  #   transHashSha2 - SOAP::SOAPString
  #   profile - CustomerProfileIdType
  #   networkTransId - SOAP::SOAPString
  class TransactionResponse
    include ROXML
    # inner class for member: prePaidCard
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}prePaidCard
    #   requestedAmount - SOAP::SOAPString
    #   approvedAmount - SOAP::SOAPString
    #   balanceOnCard - SOAP::SOAPString
    class PrePaidCard
      include ROXML
      xml_accessor :requestedAmount
      xml_accessor :approvedAmount
      xml_accessor :balanceOnCard

      def initialize(requestedAmount = nil, approvedAmount = nil, balanceOnCard = nil)
        @requestedAmount = requestedAmount
        @approvedAmount = approvedAmount
        @balanceOnCard = balanceOnCard
      end
    end

    # inner class for member: messages
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}messages
    class Messages
      include ROXML
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}message
      #   code - SOAP::SOAPString
      #   description - SOAP::SOAPString
      class Message
        include ROXML
        xml_accessor :code
        xml_accessor :description

        def initialize(code = nil, description = nil)
          @code = code
          @description = description
        end
      end

      xml_accessor :messages, as: [Messages::Message]

      def initialize(messages = [])
        @messages = messages
      end
    end

    # inner class for member: errors
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}errors
    class Errors
      include ROXML
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}error
      #   errorCode - SOAP::SOAPString
      #   errorText - SOAP::SOAPString
      class Error
        include ROXML
        xml_accessor :errorCode
        xml_accessor :errorText

        def initialize(errorCode = nil, errorText = nil)
          @errorCode = errorCode
          @errorText = errorText
        end
      end

      xml_accessor :errors, as: [Error]

      def initialize(errors = [])
        @errors = errors
      end
    end

    # inner class for member: splitTenderPayments
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}splitTenderPayments
    class SplitTenderPayments
      include ROXML
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}splitTenderPayment
      #   transId - SOAP::SOAPString
      #   responseCode - SOAP::SOAPString
      #   responseToCustomer - SOAP::SOAPString
      #   authCode - SOAP::SOAPString
      #   accountNumber - SOAP::SOAPString
      #   accountType - SOAP::SOAPString
      #   requestedAmount - SOAP::SOAPString
      #   approvedAmount - SOAP::SOAPString
      #   balanceOnCard - SOAP::SOAPString
      class SplitTenderPayment
        include ROXML
        xml_accessor :transId
        xml_accessor :responseCode
        xml_accessor :responseToCustomer
        xml_accessor :authCode
        xml_accessor :accountNumber
        xml_accessor :accountType
        xml_accessor :requestedAmount
        xml_accessor :approvedAmount
        xml_accessor :balanceOnCard

        def initialize(transId = nil, responseCode = nil, responseToCustomer = nil, authCode = nil, accountNumber = nil, accountType = nil, requestedAmount = nil, approvedAmount = nil, balanceOnCard = nil)
          @transId = transId
          @responseCode = responseCode
          @responseToCustomer = responseToCustomer
          @authCode = authCode
          @accountNumber = accountNumber
          @accountType = accountType
          @requestedAmount = requestedAmount
          @approvedAmount = approvedAmount
          @balanceOnCard = balanceOnCard
        end
      end

      xml_accessor :splitTenderPayments, as: [SplitTenderPayment]

      def initialize(splitTenderPayments = [])
        @splitTenderPayments = splitTenderPayments
      end
    end

    # inner class for member: secureAcceptance
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}secureAcceptance
    #   secureAcceptanceUrl - SOAP::SOAPString
    #   payerID - SOAP::SOAPString
    #   payerEmail - SOAP::SOAPString
    class SecureAcceptance
      include ROXML
      xml_accessor :SecureAcceptanceUrl
      xml_accessor :PayerID
      xml_accessor :PayerEmail

      def initialize(secureAcceptanceUrl = nil, payerID = nil, payerEmail = nil)
        @SecureAcceptanceUrl = secureAcceptanceUrl
        @PayerID = payerID
        @PayerEmail = payerEmail
      end
    end

    # inner class for member: emvResponse
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}emvResponse
    class EmvResponse
      include ROXML

      class Tags
        include ROXML
        xml_accessor :tag, as: [EmvTag]

        def initialize(tag = nil)
          @tag = tag
        end
      end

      xml_accessor :tlvData
      xml_accessor :tags, as: [Tags]

      def initialize(tlvData = nil, tags = nil)
        @tlvData = tlvData
        @tags = tags
      end
    end

    xml_accessor :responseCode
    xml_accessor :rawResponseCode
    xml_accessor :authCode
    xml_accessor :avsResultCode
    xml_accessor :cvvResultCode
    xml_accessor :cavvResultCode
    xml_accessor :transId
    xml_accessor :refTransID
    xml_accessor :transHash
    xml_accessor :testRequest
    xml_accessor :accountNumber
    xml_accessor :accountType
    xml_accessor :splitTenderId
    xml_accessor :prePaidCard, as: PrePaidCard
    xml_accessor :messages, as: Messages
    xml_accessor :errors, as: Errors
    xml_accessor :splitTenderPayments, as: SplitTenderPayments
    xml_accessor :userFields, as: UserFields
    xml_accessor :shipTo, as: NameAndAddressType
    xml_accessor :secureAcceptance, as: SecureAcceptance
    xml_accessor :emvResponse, as: EmvResponse
    xml_accessor :transHashSha2
    xml_accessor :profile, as: CustomerProfileIdType
    xml_accessor :networkTransId 

    def initialize(responseCode = nil, rawResponseCode = nil, authCode = nil, avsResultCode = nil, cvvResultCode = nil, cavvResultCode = nil, transId = nil, refTransID = nil, transHash = nil, testRequest = nil, accountNumber = nil, accountType = nil, splitTenderId = nil, prePaidCard = nil, messages = nil, errors = nil, splitTenderPayments = nil, userFields = nil, shipTo = nil, secureAcceptance = nil, emvResponse = nil, transHashSha2 = nil, profile = nil,networkTransId = nil)
      @responseCode = responseCode
      @rawResponseCode = rawResponseCode
      @authCode = authCode
      @avsResultCode = avsResultCode
      @cvvResultCode = cvvResultCode
      @cavvResultCode = cavvResultCode
      @transId = transId
      @refTransID = refTransID
      @transHash = transHash
      @testRequest = testRequest
      @accountNumber = accountNumber
      @accountType = accountType
      @splitTenderId = splitTenderId
      @prePaidCard = prePaidCard
      @messages = messages
      @errors = errors
      @splitTenderPayments = splitTenderPayments
      @userFields = userFields
      @shipTo = shipTo
      @secureAcceptance = secureAcceptance
      @emvResponse = emvResponse
      @transHashSha2 = transHashSha2
      @profile = profile
      @networkTransId = networkTransId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ANetApiRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   clientId - SOAP::SOAPString
  #   refId - SOAP::SOAPString
  class ANetApiRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :clientId
    xml_accessor :refId

    def initialize(merchantAuthentication = nil, clientId = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @clientId = clientId
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}messageTypeEnum
  class MessageTypeEnum < ::String
    Error = MessageTypeEnum.new("Error")
    Ok = MessageTypeEnum.new("Ok")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}messagesType
  #   resultCode - MessageTypeEnum
  #   message - MessagesType::Message
  class MessagesType
    include ROXML
    # inner class for member: message
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}message
    #   code - SOAP::SOAPString
    #   text - SOAP::SOAPString
    class Message
      include ROXML
      xml_accessor :code
      xml_accessor :text

      def initialize(code = nil, text = nil)
        @code = code
        @text = text
      end
    end

    xml_accessor :resultCode
    xml_accessor :messages, as: [MessagesType::Message]

    def initialize(resultCode = nil, messages = [])
      @resultCode = resultCode
      @messages = messages
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ANetApiResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class ANetApiResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createProfileResponse
  #   messages - MessagesType
  #   customerProfileId - (any)
  #   customerPaymentProfileIdList - ArrayOfNumericString
  #   customerShippingAddressIdList - ArrayOfNumericString
  class CreateProfileResponse
    include ROXML
    xml_accessor :messages, as: MessagesType
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileIdList, as: NumericStringsType
    xml_accessor :customerShippingAddressIdList, as: NumericStringsType

    def initialize(messages = nil, customerProfileId = nil, customerPaymentProfileIdList = nil, customerShippingAddressIdList = nil)
      @messages = messages
      @customerProfileId = customerProfileId
      @customerPaymentProfileIdList = customerPaymentProfileIdList
      @customerShippingAddressIdList = customerShippingAddressIdList
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}Paging
  #   limit - SOAP::SOAPInt
  #   offset - SOAP::SOAPInt
  class Paging
    include ROXML
    xml_accessor :limit
    xml_accessor :offset

    def initialize(limit = nil, offset = nil)
      @limit = limit
      @offset = offset
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionListSorting
  #   orderBy - ARBGetSubscriptionListOrderFieldEnum
  #   orderDescending - SOAP::SOAPBoolean
  class ARBGetSubscriptionListSorting
    include ROXML
    xml_accessor :orderBy
    xml_accessor :orderDescending

    def initialize(orderBy = nil, orderDescending = nil)
      @orderBy = orderBy
      @orderDescending = orderDescending
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}SubscriptionDetail
  #   id - SOAP::SOAPInt
  #   name - SOAP::SOAPString
  #   status - ARBSubscriptionStatusEnum
  #   createTimeStampUTC - SOAP::SOAPDateTime
  #   firstName - SOAP::SOAPString
  #   lastName - SOAP::SOAPString
  #   totalOccurrences - SOAP::SOAPInt
  #   pastOccurrences - SOAP::SOAPInt
  #   paymentMethod - PaymentMethodEnum
  #   accountNumber - SOAP::SOAPString
  #   invoice - SOAP::SOAPString
  #   amount - SOAP::SOAPDecimal
  #   currencyCode - SOAP::SOAPString
  #   customerProfileId - SOAP::SOAPInt
  #   customerPaymentProfileId - SOAP::SOAPInt
  #   totalOccurrences - SOAP::SOAPInt
  class SubscriptionDetail
    include ROXML
    xml_accessor :id
    xml_accessor :name
    xml_accessor :status
    xml_accessor :createTimeStampUTC
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :totalOccurrences
    xml_accessor :pastOccurrences
    xml_accessor :paymentMethod
    xml_accessor :accountNumber
    xml_accessor :invoice
    xml_accessor :amount
    xml_accessor :currencyCode
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingProfileId

    def initialize(id = nil, name = nil, status = nil, createTimeStampUTC = nil, firstName = nil, lastName = nil, totalOccurrences = nil, pastOccurrences = nil, paymentMethod = nil, accountNumber = nil, invoice = nil, amount = nil, currencyCode = nil, customerProfileId = nil, customerPaymentProfileId = nil, customerShippingProfileId = nil)
      @id = id
      @name = name
      @status = status
      @createTimeStampUTC = createTimeStampUTC
      @firstName = firstName
      @lastName = lastName
      @totalOccurrences = totalOccurrences
      @pastOccurrences = pastOccurrences
      @paymentMethod = paymentMethod
      @accountNumber = accountNumber
      @invoice = invoice
      @amount = amount
      @currencyCode = currencyCode
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingProfileId = customerShippingProfileId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfSubscription
  class ArrayOfSubscription < ::Array
    include ROXML
    xml_accessor :subscriptionDetail, as: [SubscriptionDetail]

    def initialize(subscriptionDetail = [])
      @subscriptionDetail = subscriptionDetail
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}searchCriteriaCustomerProfileType
  #   merchantCustomerId - SOAP::SOAPString
  #   email - SOAP::SOAPString
  class SearchCriteriaCustomerProfileType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :email

    def initialize(merchantCustomerId = nil, email = nil)
      @merchantCustomerId = merchantCustomerId
      @email = email
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileSummaryType
  #   merchantCustomerId - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerProfileId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  class CustomerProfileSummaryType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :email
    xml_accessor :customerProfileId
    xml_accessor :description

    def initialize(merchantCustomerId = nil, email = nil, customerProfileId = nil, description = nil)
      @merchantCustomerId = merchantCustomerId
      @email = email
      @customerProfileId = customerProfileId
      @description = description
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentProfile
  #   paymentProfileId - (any)
  #   cardCode - (any)
  class PaymentProfile
    include ROXML
    xml_accessor :paymentProfileId, as: Integer
    xml_accessor :cardCode

    def initialize(paymentProfileId = nil, cardCode = nil)
      @paymentProfileId = paymentProfileId
      @cardCode = cardCode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfilePaymentType
  #   createProfile - SOAP::SOAPBoolean
  #   customerProfileId - (any)
  #   paymentProfile - PaymentProfile
  #   shippingProfileId - (any)
  class CustomerProfilePaymentType
    include ROXML
    xml_accessor :createProfile
    xml_accessor :customerProfileId, as: Integer
    xml_accessor :paymentProfile, as: PaymentProfile
    xml_accessor :shippingProfileId, as: Integer

    def initialize(createProfile = nil, customerProfileId = nil, paymentProfile = nil, shippingProfileId = nil)
      @createProfile = createProfile
      @customerProfileId = customerProfileId
      @paymentProfile = paymentProfile
      @shippingProfileId = shippingProfileId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}bankAccountTypeEnum
  class BankAccountTypeEnum < ::String
    BusinessChecking = BankAccountTypeEnum.new("businessChecking")
    Checking = BankAccountTypeEnum.new("checking")
    Savings = BankAccountTypeEnum.new("savings")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}echeckTypeEnum
  class EcheckTypeEnum < ::String
    ARC = EcheckTypeEnum.new("ARC")
    BOC = EcheckTypeEnum.new("BOC")
    CCD = EcheckTypeEnum.new("CCD")
    PPD = EcheckTypeEnum.new("PPD")
    TEL = EcheckTypeEnum.new("TEL")
    WEB = EcheckTypeEnum.new("WEB")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentMethodEnum
  class PaymentMethodEnum < ::String
    CreditCard = PaymentMethodEnum.new("creditCard")
    ECheck = PaymentMethodEnum.new("eCheck")
    PayPal = PaymentMethodEnum.new("payPal")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}cardTypeEnum
  class CardTypeEnum < ::String
    AmericanExpress = CardTypeEnum.new("AmericanExpress")
    DinersClub = CardTypeEnum.new("DinersClub")
    Discover = CardTypeEnum.new("Discover")
    JCB = CardTypeEnum.new("JCB")
    MasterCard = CardTypeEnum.new("MasterCard")
    Visa = CardTypeEnum.new("Visa")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}accountTypeEnum
  class AccountTypeEnum < ::String
    AmericanExpress = AccountTypeEnum.new("AmericanExpress")
    DinersClub = AccountTypeEnum.new("DinersClub")
    Discover = AccountTypeEnum.new("Discover")
    ECheck = AccountTypeEnum.new("eCheck")
    JCB = AccountTypeEnum.new("JCB")
    MasterCard = AccountTypeEnum.new("MasterCard")
    Visa = AccountTypeEnum.new("Visa")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerTypeEnum
  class CustomerTypeEnum < ::String
    Business = CustomerTypeEnum.new("business")
    Individual = CustomerTypeEnum.new("individual")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBSubscriptionUnitEnum
  class ARBSubscriptionUnitEnum < ::String
    Days = ARBSubscriptionUnitEnum.new("days")
    Months = ARBSubscriptionUnitEnum.new("months")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}validationModeEnum
  class ValidationModeEnum < ::String
    LiveMode = ValidationModeEnum.new("liveMode")
    None = ValidationModeEnum.new("none")
    OldLiveMode = ValidationModeEnum.new("oldLiveMode")
    TestMode = ValidationModeEnum.new("testMode")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}splitTenderStatusEnum
  class SplitTenderStatusEnum < ::String
    Completed = SplitTenderStatusEnum.new("completed")
    Held = SplitTenderStatusEnum.new("held")
    Voided = SplitTenderStatusEnum.new("voided")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBSubscriptionStatusEnum
  class ARBSubscriptionStatusEnum < ::String
    Active = ARBSubscriptionStatusEnum.new("active")
    Canceled = ARBSubscriptionStatusEnum.new("canceled")
    Expired = ARBSubscriptionStatusEnum.new("expired")
    Suspended = ARBSubscriptionStatusEnum.new("suspended")
    Terminated = ARBSubscriptionStatusEnum.new("terminated")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transactionTypeEnum
  class TransactionTypeEnum < ::String
    AuthCaptureContinueTransaction = TransactionTypeEnum.new("authCaptureContinueTransaction")
    AuthCaptureTransaction = TransactionTypeEnum.new("authCaptureTransaction")
    AuthOnlyContinueTransaction = TransactionTypeEnum.new("authOnlyContinueTransaction")
    AuthOnlyTransaction = TransactionTypeEnum.new("authOnlyTransaction")
    CaptureOnlyTransaction = TransactionTypeEnum.new("captureOnlyTransaction")
    GetDetailsTransaction = TransactionTypeEnum.new("getDetailsTransaction")
    PriorAuthCaptureTransaction = TransactionTypeEnum.new("priorAuthCaptureTransaction")
    RefundTransaction = TransactionTypeEnum.new("refundTransaction")
    VoidTransaction = TransactionTypeEnum.new("voidTransaction")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transactionStatusEnum
  class TransactionStatusEnum < ::String
    ApprovedReview = TransactionStatusEnum.new("approvedReview")
    AuthorizedPendingCapture = TransactionStatusEnum.new("authorizedPendingCapture")
    AuthorizedPendingRelease = TransactionStatusEnum.new("authorizedPendingRelease")
    CapturedPendingSettlement = TransactionStatusEnum.new("capturedPendingSettlement")
    Chargeback = TransactionStatusEnum.new("chargeback")
    ChargebackReversal = TransactionStatusEnum.new("chargebackReversal")
    CommunicationError = TransactionStatusEnum.new("communicationError")
    CouldNotVoid = TransactionStatusEnum.new("couldNotVoid")
    Declined = TransactionStatusEnum.new("declined")
    Expired = TransactionStatusEnum.new("expired")
    FDSAuthorizedPendingReview = TransactionStatusEnum.new("FDSAuthorizedPendingReview")
    FDSPendingReview = TransactionStatusEnum.new("FDSPendingReview")
    FailedReview = TransactionStatusEnum.new("failedReview")
    GeneralError = TransactionStatusEnum.new("generalError")
    PendingFinalSettlement = TransactionStatusEnum.new("pendingFinalSettlement")
    PendingSettlement = TransactionStatusEnum.new("pendingSettlement")
    RefundPendingSettlement = TransactionStatusEnum.new("refundPendingSettlement")
    RefundSettledSuccessfully = TransactionStatusEnum.new("refundSettledSuccessfully")
    ReturnedItem = TransactionStatusEnum.new("returnedItem")
    SettledSuccessfully = TransactionStatusEnum.new("settledSuccessfully")
    SettlementError = TransactionStatusEnum.new("settlementError")
    UnderReview = TransactionStatusEnum.new("underReview")
    UpdatingSettlement = TransactionStatusEnum.new("updatingSettlement")
    Voided = TransactionStatusEnum.new("voided")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}settlementStateEnum
  class SettlementStateEnum < ::String
    PendingSettlement = SettlementStateEnum.new("pendingSettlement")
    SettledSuccessfully = SettlementStateEnum.new("settledSuccessfully")
    SettlementError = SettlementStateEnum.new("settlementError")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}FDSFilterActionEnum
  class FDSFilterActionEnum < ::String
    AuthAndHold = FDSFilterActionEnum.new("authAndHold")
    Decline = FDSFilterActionEnum.new("decline")
    Hold = FDSFilterActionEnum.new("hold")
    Reject = FDSFilterActionEnum.new("reject")
    Report = FDSFilterActionEnum.new("report")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}permissionsEnum
  class PermissionsEnum < ::String
    API_Merchant_BasicReporting = PermissionsEnum.new("API_Merchant_BasicReporting")
    Mobile_Admin = PermissionsEnum.new("Mobile_Admin")
    Submit_Charge = PermissionsEnum.new("Submit_Charge")
    Submit_Refund = PermissionsEnum.new("Submit_Refund")
    Submit_Update = PermissionsEnum.new("Submit_Update")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deviceActivationEnum
  class DeviceActivationEnum < ::String
    Activate = DeviceActivationEnum.new("Activate")
    Disable = DeviceActivationEnum.new("Disable")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}settingNameEnum
  class SettingNameEnum < ::String
    AllowPartialAuth = SettingNameEnum.new("allowPartialAuth")
    DuplicateWindow = SettingNameEnum.new("duplicateWindow")
    EmailCustomer = SettingNameEnum.new("emailCustomer")
    FooterEmailReceipt = SettingNameEnum.new("footerEmailReceipt")
    HeaderEmailReceipt = SettingNameEnum.new("headerEmailReceipt")
    HostedProfileBillingAddressRequired = SettingNameEnum.new("hostedProfileBillingAddressRequired")
    HostedProfileCardCodeRequired = SettingNameEnum.new("hostedProfileCardCodeRequired")
    HostedProfileHeadingBgColor = SettingNameEnum.new("hostedProfileHeadingBgColor")
    HostedProfileIFrameCommunicatorUrl = SettingNameEnum.new("hostedProfileIFrameCommunicatorUrl")
    HostedProfilePageBorderVisible = SettingNameEnum.new("hostedProfilePageBorderVisible")
    HostedProfileReturnUrl = SettingNameEnum.new("hostedProfileReturnUrl")
    HostedProfileReturnUrlText = SettingNameEnum.new("hostedProfileReturnUrlText")
    HostedProfileValidationMode = SettingNameEnum.new("hostedProfileValidationMode")
    HostedProfileBillingAddressOptions = SettingNameEnum.new("hostedProfileBillingAddressOptions")
    HostedProfileManageOptions = SettingNameEnum.new("hostedProfileManageOptions")
    HostedPaymentIFrameCommunicatorUrl = SettingNameEnum.new("hostedPaymentIFrameCommunicatorUrl")
    HostedPaymentButtonOptions = SettingNameEnum.new("hostedPaymentButtonOptions")
    HostedPaymentReturnOptions = SettingNameEnum.new("hostedPaymentReturnOptions")
    HostedPaymentOrderOptions = SettingNameEnum.new("hostedPaymentOrderOptions")
    HostedPaymentPaymentOptions = SettingNameEnum.new("hostedPaymentPaymentOptions")
    HostedPaymentBillingAddressOptions = SettingNameEnum.new("hostedPaymentBillingAddressOptions")
    HostedPaymentShippingAddressOptions = SettingNameEnum.new("hostedPaymentShippingAddressOptions")
    HostedPaymentSecurityOptions = SettingNameEnum.new("hostedPaymentSecurityOptions")
    HostedPaymentCustomerOptions = SettingNameEnum.new("hostedPaymentCustomerOptions")
    HostedPaymentStyleOptions = SettingNameEnum.new("hostedPaymentStyleOptions")
    MerchantEmail = SettingNameEnum.new("merchantEmail")
    RecurringBilling = SettingNameEnum.new("recurringBilling")
    TestRequest = SettingNameEnum.new("testRequest")
    TypeEmailReceipt = SettingNameEnum.new("typeEmailReceipt")
    HostedProfilePaymentOptions = SettingNameEnum.new("hostedProfilePaymentOptions")
	HostedProfileSaveButtonText = SettingNameEnum.new("hostedProfileSaveButtonText")
	HostedPaymentVisaCheckoutOptions = SettingNameEnum.new("hostedPaymentVisaCheckoutOptions")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionListSearchTypeEnum
  class ARBGetSubscriptionListSearchTypeEnum < ::String
    CardExpiringThisMonth = ARBGetSubscriptionListSearchTypeEnum.new("cardExpiringThisMonth")
    SubscriptionActive = ARBGetSubscriptionListSearchTypeEnum.new("subscriptionActive")
    SubscriptionExpiringThisMonth = ARBGetSubscriptionListSearchTypeEnum.new("subscriptionExpiringThisMonth")
    SubscriptionInactive = ARBGetSubscriptionListSearchTypeEnum.new("subscriptionInactive")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionListOrderFieldEnum
  class ARBGetSubscriptionListOrderFieldEnum < ::String
    AccountNumber = ARBGetSubscriptionListOrderFieldEnum.new("accountNumber")
    Amount = ARBGetSubscriptionListOrderFieldEnum.new("amount")
    CreateTimeStampUTC = ARBGetSubscriptionListOrderFieldEnum.new("createTimeStampUTC")
    FirstName = ARBGetSubscriptionListOrderFieldEnum.new("firstName")
    Id = ARBGetSubscriptionListOrderFieldEnum.new("id")
    LastName = ARBGetSubscriptionListOrderFieldEnum.new("lastName")
    Name = ARBGetSubscriptionListOrderFieldEnum.new("name")
    PastOccurrences = ARBGetSubscriptionListOrderFieldEnum.new("pastOccurrences")
    Status = ARBGetSubscriptionListOrderFieldEnum.new("status")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}isAliveRequest
  #   refId - SOAP::SOAPString
  class IsAliveRequest
    include ROXML
    xml_accessor :refId

    def initialize(refId = nil)
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}isAliveResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class IsAliveResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}authenticateTestRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class AuthenticateTestRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId

    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}authenticateTestResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class AuthenticateTestResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBCreateSubscriptionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   subscription - ARBSubscriptionType
  class ARBCreateSubscriptionRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :subscription, as: ARBSubscriptionType

    def initialize(merchantAuthentication = nil, refId = nil, subscription = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @subscription = subscription
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBCreateSubscriptionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   subscriptionId - (any)
  #   profile - CustomerProfileIdType
  class ARBCreateSubscriptionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :subscriptionId
    xml_accessor :profile, as: CustomerProfileIdType

    def initialize(refId = nil, messages = nil, sessionToken = nil, subscriptionId = nil, profile = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @subscriptionId = subscriptionId
      @profile = profile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBUpdateSubscriptionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   subscriptionId - (any)
  #   subscription - ARBSubscriptionType
  class ARBUpdateSubscriptionRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :subscriptionId
    xml_accessor :subscription, as: ARBSubscriptionType

    def initialize(merchantAuthentication = nil, refId = nil, subscriptionId = nil, subscription = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @subscriptionId = subscriptionId
      @subscription = subscription
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBUpdateSubscriptionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   profile - CustomerProfileIdType
  class ARBUpdateSubscriptionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :profile, as: CustomerProfileIdType

    def initialize(refId = nil, messages = nil, sessionToken = nil, profile = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @profile = profile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBCancelSubscriptionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   subscriptionId - (any)
  class ARBCancelSubscriptionRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :subscriptionId

    def initialize(merchantAuthentication = nil, refId = nil, subscriptionId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @subscriptionId = subscriptionId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBCancelSubscriptionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class ARBCancelSubscriptionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionStatusRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   subscriptionId - (any)
  class ARBGetSubscriptionStatusRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :subscriptionId

    def initialize(merchantAuthentication = nil, refId = nil, subscriptionId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @subscriptionId = subscriptionId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionStatusResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   status - ARBSubscriptionStatusEnum
  class ARBGetSubscriptionStatusResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :status

    def initialize(refId = nil, messages = nil, sessionToken = nil, status = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @status = status
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   profile - CustomerProfileType
  #   validationMode - ValidationModeEnum
  class CreateCustomerProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :profile, as: CustomerProfileType
    xml_accessor :validationMode

    def initialize(merchantAuthentication = nil, refId = nil, profile = nil, validationMode = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @profile = profile
      @validationMode = validationMode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerPaymentProfileIdList - ArrayOfNumericString
  #   customerShippingAddressIdList - ArrayOfNumericString
  #   validationDirectResponseList - ArrayOfString
  class CreateCustomerProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileIdList, as: NumericStringsType
    xml_accessor :customerShippingAddressIdList, as: NumericStringsType
    xml_accessor :validationDirectResponseList

    def initialize(refId = nil, messages = nil, sessionToken = nil, customerProfileId = nil, customerPaymentProfileIdList = nil, customerShippingAddressIdList = nil, validationDirectResponseList = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @customerProfileId = customerProfileId
      @customerPaymentProfileIdList = customerPaymentProfileIdList
      @customerShippingAddressIdList = customerShippingAddressIdList
      @validationDirectResponseList = validationDirectResponseList
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerPaymentProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   paymentProfile - CustomerPaymentProfileType
  #   validationMode - ValidationModeEnum
  class CreateCustomerPaymentProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :paymentProfile, as: CustomerPaymentProfileType
    xml_accessor :validationMode

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, paymentProfile = nil, validationMode = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @paymentProfile = paymentProfile
      @validationMode = validationMode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerPaymentProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   validationDirectResponse - SOAP::SOAPString
  class CreateCustomerPaymentProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :validationDirectResponse

    def initialize(refId = nil, messages = nil, sessionToken = nil, customerProfileId = nil, customerPaymentProfileId = nil, validationDirectResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @validationDirectResponse = validationDirectResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerShippingAddressRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   address - CustomerAddressType
  class CreateCustomerShippingAddressRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :address, as: CustomerAddressType
    xml_accessor :defaultShippingAddress

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, address = nil, defaultShippingAddress = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @address = address
      @defaultShippingAddress = defaultShippingAddress
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerShippingAddressResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerAddressId - (any)
  class CreateCustomerShippingAddressResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :customerProfileId
    xml_accessor :customerAddressId

    def initialize(refId = nil, messages = nil, sessionToken = nil, customerProfileId = nil, customerAddressId = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @customerProfileId = customerProfileId
      @customerAddressId = customerAddressId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerProfileFromTransactionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transId - (any)
  #   customer - CustomerProfileBaseType
  #   customerProfileId - NumericStringsType
  #   profileType - CustomerProfileTypeEnum
  class CreateCustomerProfileFromTransactionRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :transId
    xml_accessor :customer, as: CustomerProfileBaseType
    xml_accessor :customerProfileId, as: NumericStringsType
    xml_accessor :defaultPaymentProfile
    xml_accessor :defaultShippingAddress
    xml_accessor :profileType

    def initialize(merchantAuthentication = nil, refId = nil, transId = nil, customer = nil, customerProfileId = nil, defaultPaymentProfile = nil, defaultShippingAddress = nil, profileType = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @transId = transId
      @customer = customer
      @customerProfileId = customerProfileId
      @defaultPaymentProfile = defaultPaymentProfile
      @defaultShippingAddress = defaultShippingAddress
      @profileType = profileType
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   merchantCustomerId - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   unmaskExpirationDate - SOAP::SOAPBoolean
  class GetCustomerProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :merchantCustomerId
    xml_accessor :email
    xml_accessor :unmaskExpirationDate
    xml_accessor :includeIssuerInfo

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, unmaskExpirationDate = nil, merchantCustomerId = nil, email = nil, includeIssuerInfo = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @merchantCustomerId = merchantCustomerId
      @email = email
      @unmaskExpirationDate = unmaskExpirationDate
      @includeIssuerInfo = includeIssuerInfo
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   profile - CustomerProfileMaskedType
  #   subscriptionIds - SubscriptionIdList
  class GetCustomerProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :profile, as: CustomerProfileMaskedType
    xml_accessor :subscriptionIds, as: SubscriptionIdList

    def initialize(refId = nil, messages = nil, sessionToken = nil, profile = nil, subscriptionIds = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @profile = profile
      @subscriptionIds = subscriptionIds
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   unmaskExpirationDate - SOAP::SOAPBoolean
  class GetCustomerPaymentProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :unmaskExpirationDate
    xml_accessor :includeIssuerInfo

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, customerPaymentProfileId = nil, unmaskExpirationDate = nil, includeIssuerInfo = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @unmaskExpirationDate = unmaskExpirationDate
      @includeIssuerInfo = includeIssuerInfo
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   paymentProfile - CustomerPaymentProfileMaskedType
  class GetCustomerPaymentProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :paymentProfile, as: CustomerPaymentProfileMaskedType

    def initialize(refId = nil, messages = nil, sessionToken = nil, paymentProfile = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @paymentProfile = paymentProfile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerShippingAddressRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerAddressId - (any)
  class GetCustomerShippingAddressRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :customerAddressId

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, customerAddressId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @customerAddressId = customerAddressId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerShippingAddressResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   address - CustomerAddressExType
  #   subscriptionIds - SubscriptionIdList
  class GetCustomerShippingAddressResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :defaultShippingAddress
    xml_accessor :address, as: CustomerAddressExType
    xml_accessor :subscriptionIds, as: SubscriptionIdList

    def initialize(refId = nil, messages = nil, sessionToken = nil, address = nil, subscriptionIds = nil, defaultShippingAddress = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @address = address
      @subscriptionIds = subscriptionIds
      @defaultShippingAddress = defaultShippingAddress
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   profile - CustomerProfileExType
  class UpdateCustomerProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :profile, as: CustomerProfileExType

    def initialize(merchantAuthentication = nil, refId = nil, profile = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @profile = profile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class UpdateCustomerProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerPaymentProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   paymentProfile - CustomerPaymentProfileExType
  #   validationMode - ValidationModeEnum
  class UpdateCustomerPaymentProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :paymentProfile, as: CustomerPaymentProfileExType
    xml_accessor :validationMode

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, paymentProfile = nil, validationMode = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @paymentProfile = paymentProfile
      @validationMode = validationMode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerPaymentProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   validationDirectResponse - SOAP::SOAPString
  class UpdateCustomerPaymentProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :validationDirectResponse

    def initialize(refId = nil, messages = nil, sessionToken = nil, validationDirectResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @validationDirectResponse = validationDirectResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerShippingAddressRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   address - CustomerAddressExType
  class UpdateCustomerShippingAddressRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :address, as: CustomerAddressExType
    xml_accessor :defaultShippingAddress

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, address = nil, defaultShippingAddress = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @address = address
      @defaultShippingAddress = defaultShippingAddress
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerShippingAddressResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class UpdateCustomerShippingAddressResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deleteCustomerProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  class DeleteCustomerProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :customerProfileId

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deleteCustomerProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class DeleteCustomerProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deleteCustomerPaymentProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  class DeleteCustomerPaymentProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, customerPaymentProfileId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deleteCustomerPaymentProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class DeleteCustomerPaymentProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deleteCustomerShippingAddressRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerAddressId - (any)
  class DeleteCustomerShippingAddressRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :customerAddressId

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, customerAddressId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @customerAddressId = customerAddressId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}deleteCustomerShippingAddressResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class DeleteCustomerShippingAddressResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerProfileTransactionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transaction - ProfileTransactionType
  #   extraOptions - SOAP::SOAPString
  class CreateCustomerProfileTransactionRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :transaction
    xml_accessor :extraOptions

    def initialize(merchantAuthentication = nil, refId = nil, transaction = nil, extraOptions = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @transaction = transaction
      @extraOptions = extraOptions
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerProfileTransactionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   transactionResponse - TransactionResponse
  #   directResponse - SOAP::SOAPString
  class CreateCustomerProfileTransactionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :transactionResponse
    xml_accessor :directResponse

    def initialize(refId = nil, messages = nil, sessionToken = nil, transactionResponse = nil, directResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactionResponse = transactionResponse
      @directResponse = directResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}validateCustomerPaymentProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  #   customerShippingAddressId - (any)
  #   cardCode - (any)
  #   validationMode - ValidationModeEnum
  class ValidateCustomerPaymentProfileRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerShippingAddressId
    xml_accessor :cardCode
    xml_accessor :validationMode

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, customerPaymentProfileId = nil, customerShippingAddressId = nil, cardCode = nil, validationMode = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @customerShippingAddressId = customerShippingAddressId
      @cardCode = cardCode
      @validationMode = validationMode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}validateCustomerPaymentProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   directResponse - SOAP::SOAPString
  class ValidateCustomerPaymentProfileResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :directResponse

    def initialize(refId = nil, messages = nil, sessionToken = nil, directResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @directResponse = directResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerProfileIdsRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class GetCustomerProfileIdsRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId

    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerProfileIdsResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   ids - ArrayOfNumericString
  class GetCustomerProfileIdsResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :ids, as: NumericStringsType

    def initialize(refId = nil, messages = nil, sessionToken = nil, ids = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @ids = ids
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateSplitTenderGroupRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   splitTenderId - SOAP::SOAPString
  #   splitTenderStatus - SplitTenderStatusEnum
  class UpdateSplitTenderGroupRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :splitTenderId
    xml_accessor :splitTenderStatus

    def initialize(merchantAuthentication = nil, refId = nil, splitTenderId = nil, splitTenderStatus = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @splitTenderId = splitTenderId
      @splitTenderStatus = splitTenderStatus
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateSplitTenderGroupResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class UpdateSplitTenderGroupResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getTransactionDetailsRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transId - (any)
  class GetTransactionDetailsRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :transId

    def initialize(merchantAuthentication = nil, refId = nil, transId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @transId = transId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getTransactionDetailsResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   transaction - TransactionDetailsType
  #   clientId - SOAP::SOAPString
  #   transrefId - SOAP::SOAPString
  class GetTransactionDetailsResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :transaction, as: TransactionDetailsType
    xml_accessor :clientId
    xml_accessor :transrefId

    def initialize(refId = nil, messages = nil, sessionToken = nil, transaction = nil, clientId = nil, transrefId = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transaction = transaction
      @clientId = clientId
      @transrefId = transrefId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getBatchStatisticsRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   batchId - (any)
  class GetBatchStatisticsRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :batchId

    def initialize(merchantAuthentication = nil, refId = nil, batchId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @batchId = batchId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getBatchStatisticsResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   batch - BatchDetailsType
  class GetBatchStatisticsResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :batch, as: BatchDetailsType

    def initialize(refId = nil, messages = nil, sessionToken = nil, batch = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @batch = batch
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getSettledBatchListRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   includeStatistics - SOAP::SOAPBoolean
  #   firstSettlementDate - SOAP::SOAPDateTime
  #   lastSettlementDate - SOAP::SOAPDateTime
  class GetSettledBatchListRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :includeStatistics
    xml_accessor :firstSettlementDate
    xml_accessor :lastSettlementDate

    def initialize(merchantAuthentication = nil, refId = nil, includeStatistics = nil, firstSettlementDate = nil, lastSettlementDate = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @includeStatistics = includeStatistics
      @firstSettlementDate = firstSettlementDate
      @lastSettlementDate = lastSettlementDate
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getSettledBatchListResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   batchList - ArrayOfBatchDetailsType
  class GetSettledBatchListResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :batchList, as: ArrayOfBatchDetailsType

    def initialize(refId = nil, messages = nil, sessionToken = nil, batchList = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @batchList = batchList
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}TransactionListOrderFieldEnum
  class TransactionListOrderFieldEnum < ::String
    Id = TransactionListOrderFieldEnum.new("id")
    SubmitTimeUTC = TransactionListOrderFieldEnum.new("submitTimeUTC")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}TransactionListSorting
  class TransactionListSorting
    include ROXML
    xml_accessor :orderBy
    xml_accessor :orderDescending

    def initialize(orderBy = nil, orderDescending = nil)
      @orderBy = orderBy
      @orderDescending = orderDescending
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getTransactionListRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   batchId - (any)
  class GetTransactionListRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :batchId
    xml_accessor :sorting, as: TransactionListSorting
    xml_accessor :paging, as: Paging

    def initialize(merchantAuthentication = nil, refId = nil, batchId = nil, sorting = nil, paging = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @batchId = batchId
      @sorting = sorting
      @paging = paging
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getTransactionListResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   transactions - ArrayOfTransactionSummaryType
  class GetTransactionListResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :transactions, as: ArrayOfTransactionSummaryType
    xml_accessor :totalNumInResultSet

    def initialize(refId = nil, messages = nil, sessionToken = nil, transactions = nil, totalNumInResultSet = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactions = transactions
      @totalNumInResultSet = totalNumInResultSet
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getHostedProfilePageRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   hostedProfileSettings - Settings
  class GetHostedProfilePageRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :hostedProfileSettings, as: Settings

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, hostedProfileSettings = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @hostedProfileSettings = hostedProfileSettings
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getHostedProfilePageResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   token - SOAP::SOAPString
  class GetHostedProfilePageResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :token

    def initialize(refId = nil, messages = nil, sessionToken = nil, token = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @token = token
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}TransactionGroupStatusEnum
  class TransactionGroupStatusEnum < ::String
    ANY = TransactionGroupStatusEnum.new("any")
    PENDINGAPPROVAL = TransactionGroupStatusEnum.new("pendingApproval")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getUnsettledTransactionListRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class GetUnsettledTransactionListRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :status
    xml_accessor :sorting, as: TransactionListSorting
    xml_accessor :paging, as: Paging

    def initialize(merchantAuthentication = nil, refId = nil, status = nil, sorting = nil, paging = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @status = status
      @sorting = sorting
      @paging = paging
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getUnsettledTransactionListResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   transactions - ArrayOfTransactionSummaryType
  class GetUnsettledTransactionListResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :transactions, as: ArrayOfTransactionSummaryType
    xml_accessor :totalNumInResultSet

    def initialize(refId = nil, messages = nil, sessionToken = nil, transactions = nil, totalNumInResultSet = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactions = transactions
      @totalNumInResultSet = totalNumInResultSet
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getTransactionListForCustomerRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - SOAP::SOAPString
  #   customerPaymentProfileId - SOAP::SOAPString
  #    sorting - TransactionListSorting
  #   paging - Paging
  class GetTransactionListForCustomerRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId
    xml_accessor :sorting, as: TransactionListSorting
    xml_accessor :paging, as: Paging

    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, customerPaymentProfileId = nil, sorting = nil, paging = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
      @sorting = sorting
      @paging = paging
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}mobileDeviceRegistrationRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   mobileDevice - MobileDeviceType
  class MobileDeviceRegistrationRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :mobileDevice

    def initialize(merchantAuthentication = nil, refId = nil, mobileDevice = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @mobileDevice = mobileDevice
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}mobileDeviceRegistrationResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class MobileDeviceRegistrationResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}mobileDeviceLoginRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class MobileDeviceLoginRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId

    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}mobileDeviceLoginResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   merchantContact - MerchantContactType
  #   userPermissions - ArrayOfPermissionType
  #   merchantAccount - TransRetailInfoType
  class MobileDeviceLoginResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :merchantContact
    xml_accessor :userPermissions
    xml_accessor :merchantAccount

    def initialize(refId = nil, messages = nil, sessionToken = nil, merchantContact = nil, userPermissions = nil, merchantAccount = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @merchantContact = merchantContact
      @userPermissions = userPermissions
      @merchantAccount = merchantAccount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}logoutRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class LogoutRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId

    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}logoutResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class LogoutResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}sendCustomerTransactionReceiptRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transId - (any)
  #   customerEmail - SOAP::SOAPString
  #   emailSettings - EmailSettingsType
  class SendCustomerTransactionReceiptRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :transId
    xml_accessor :customerEmail
    xml_accessor :emailSettings

    def initialize(merchantAuthentication = nil, refId = nil, transId = nil, customerEmail = nil, emailSettings = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @transId = transId
      @customerEmail = customerEmail
      @emailSettings = emailSettings
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}sendCustomerTransactionReceiptResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class SendCustomerTransactionReceiptResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken

    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionListRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   searchType - ARBGetSubscriptionListSearchTypeEnum
  #   sorting - ARBGetSubscriptionListSorting
  #   paging - Paging
  class ARBGetSubscriptionListRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :searchType
    xml_accessor :sorting, as: ARBGetSubscriptionListSorting
    xml_accessor :paging, as: Paging

    def initialize(merchantAuthentication = nil, refId = nil, searchType = nil, sorting = nil, paging = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @searchType = searchType
      @sorting = sorting
      @paging = paging
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionListResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   totalNumInResultSet - SOAP::SOAPInt
  #   subscriptionDetails - ArrayOfSubscription
  class ARBGetSubscriptionListResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :totalNumInResultSet
    xml_accessor :subscriptionDetails, as: ArrayOfSubscription

    def initialize(refId = nil, messages = nil, sessionToken = nil, totalNumInResultSet = nil, subscriptionDetails = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @totalNumInResultSet = totalNumInResultSet
      @subscriptionDetails = subscriptionDetails
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}decryptPaymentDataRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   opaqueData - OpaqueDataType
  #   callId - SOAP::SOAPString
  class DecryptPaymentDataRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :opaqueData, as: OpaqueDataType
    xml_accessor :callId

    def initialize(merchantAuthentication = nil, refId = nil, opaqueData = nil, callId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @opaqueData = opaqueData
      @callId = callId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}decryptPaymentDataResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   shippingInfo - CustomerAddressType
  #   billingInfo - CustomerAddressType
  #   cardInfo - CreditCardMaskedType
  #   paymentDetails - PaymentDetails
  class DecryptPaymentDataResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :shippingInfo, as: CustomerAddressType
    xml_accessor :billingInfo, as: CustomerAddressType
    xml_accessor :cardInfo, as: CreditCardMaskedType
    xml_accessor :paymentDetails, as: PaymentDetails

    def initialize(refId = nil, messages = nil, sessionToken = nil, shippingInfo = nil, billingInfo = nil, cardInfo = nil, paymentDetails = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @shippingInfo = shippingInfo
      @billingInfo = billingInfo
      @cardInfo = cardInfo
      @paymentDetails = paymentDetails
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}EnumCollection
  #   customerProfileSummaryType - CustomerProfileSummaryType
  #   paymentSimpleType - PaymentSimpleType
  #   accountTypeEnum - AccountTypeEnum
  #   cardTypeEnum - CardTypeEnum
  #   fDSFilterActionEnum - FDSFilterActionEnum
  #   permissionsEnum - PermissionsEnum
  #   settingNameEnum - SettingNameEnum
  #   settlementStateEnum - SettlementStateEnum
  #   transactionStatusEnum - TransactionStatusEnum
  #   transactionTypeEnum - TransactionTypeEnum
  class EnumCollection
    include ROXML
    xml_accessor :customerProfileSummaryType
    xml_accessor :paymentSimpleType
    xml_accessor :accountTypeEnum
    xml_accessor :cardTypeEnum
    xml_accessor :fDSFilterActionEnum
    xml_accessor :permissionsEnum
    xml_accessor :settingNameEnum
    xml_accessor :settlementStateEnum
    xml_accessor :transactionStatusEnum
    xml_accessor :transactionTypeEnum

    def initialize(customerProfileSummaryType = nil, paymentSimpleType = nil, accountTypeEnum = nil, cardTypeEnum = nil, fDSFilterActionEnum = nil, permissionsEnum = nil, settingNameEnum = nil, settlementStateEnum = nil, transactionStatusEnum = nil, transactionTypeEnum = nil)
      @customerProfileSummaryType = customerProfileSummaryType
      @paymentSimpleType = paymentSimpleType
      @accountTypeEnum = accountTypeEnum
      @cardTypeEnum = cardTypeEnum
      @fDSFilterActionEnum = fDSFilterActionEnum
      @permissionsEnum = permissionsEnum
      @settingNameEnum = settingNameEnum
      @settlementStateEnum = settlementStateEnum
      @transactionStatusEnum = transactionStatusEnum
      @transactionTypeEnum = transactionTypeEnum
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transactionRequestType
  #   transactionType - SOAP::SOAPString
  #   amount - SOAP::SOAPDecimal
  #   currencyCode - SOAP::SOAPString
  #   payment - PaymentType
  #   profile - CustomerProfilePaymentType
  #   solution - SolutionType
  #   callId - SOAP::SOAPString
  #   authCode - SOAP::SOAPString
  #   refTransId - SOAP::SOAPString
  #   splitTenderId - SOAP::SOAPString
  #   order - OrderType
  #   lineItems - ArrayOfLineItem
  #   tax - ExtendedAmountType
  #   duty - ExtendedAmountType
  #   shipping - ExtendedAmountType
  #   taxExempt - SOAP::SOAPBoolean
  #   poNumber - SOAP::SOAPString
  #   customer - CustomerDataType
  #   billTo - CustomerAddressType
  #   shipTo - NameAndAddressType
  #   customerIP - SOAP::SOAPString
  #   cardholderAuthentication - CcAuthenticationType
  #   retail - TransRetailInfoType
  #   transactionSettings - Settings
  #   userFields - TransactionRequestType::UserFields
  #   processingOptions - ProcessingOptions
  #   subsequentAuthInformation - SubsequentAuthInformation
  #   otherTax - OtherTaxType
  #   shipFrom - NameAndAddressType
  #   authorizationIndicatorType - AuthorizationIndicatorType

  class TransactionRequestType
    include ROXML
    xml_accessor :transactionType
    xml_accessor :amount, as: BigDecimal
    xml_accessor :currencyCode
    xml_accessor :payment, as: PaymentType
    xml_accessor :profile, as: CustomerProfilePaymentType
    xml_accessor :solution, as: SolutionType
    xml_accessor :callId
    xml_accessor :authCode
    xml_accessor :refTransId
    xml_accessor :splitTenderId
    xml_accessor :order, as: OrderType
    xml_accessor :lineItems, as: LineItems
    xml_accessor :tax, as: ExtendedAmountType
    xml_accessor :duty, as: ExtendedAmountType
    xml_accessor :shipping, as: ExtendedAmountType
    xml_accessor :taxExempt
    xml_accessor :poNumber
    xml_accessor :customer, as: CustomerDataType
    xml_accessor :billTo, as: CustomerAddressType
    xml_accessor :shipTo, as: NameAndAddressType
    xml_accessor :customerIP
    xml_accessor :cardholderAuthentication, as: CcAuthenticationType
    xml_accessor :retail, as: TransRetailInfoType
    xml_accessor :employeeId
    xml_accessor :transactionSettings, as: Settings
    xml_accessor :userFields, as: UserFields
    xml_accessor :surcharge, as: ExtendedAmountType
    xml_accessor :merchantDescriptor
    xml_accessor :subMerchant, as: SubMerchantType
    xml_accessor :tip, as: ExtendedAmountType
    xml_accessor :processingOptions, as: ProcessingOptions
    xml_accessor :subsequentAuthInformation, as: SubsequentAuthInformation
    xml_accessor :otherTax, as: OtherTaxType
    xml_accessor :shipFrom, as: NameAndAddressType
	xml_accessor :authorizationIndicatorType, as: AuthorizationIndicatorType

    def initialize(transactionType = nil, amount = nil, currencyCode = nil, payment = nil, profile = nil, solution = nil, callId = nil, authCode = nil, refTransId = nil, splitTenderId = nil, order = nil, lineItems = nil, tax = nil, duty = nil, shipping = nil, taxExempt = nil, poNumber = nil, customer = nil, billTo = nil, shipTo = nil, customerIP = nil, cardholderAuthentication = nil, retail = nil, transactionSettings = nil, userFields = nil, surcharge = nil, merchantDescriptor = nil, subMerchant = nil, tip = nil, employeeId = nil, processingOptions = nil, subsequentAuthInformation= nil, otherTax = nil, shipFrom = nil, authorizationIndicatorType = nil)
      @transactionType = transactionType
      @amount = amount
      @currencyCode = currencyCode
      @payment = payment
      @profile = profile
      @solution = solution
      @callId = callId
      @authCode = authCode
      @refTransId = refTransId
      @splitTenderId = splitTenderId
      @order = order
      @lineItems = lineItems
      @tax = tax
      @duty = duty
      @shipping = shipping
      @taxExempt = taxExempt
      @poNumber = poNumber
      @customer = customer
      @billTo = billTo
      @shipTo = shipTo
      @customerIP = customerIP
      @cardholderAuthentication = cardholderAuthentication
      @retail = retail
      @transactionSettings = transactionSettings
      @userFields = userFields
      @surcharge = surcharge
      @merchantDescriptor = merchantDescriptor
      @subMerchant = subMerchant
      @tip = tip
      @employeeId = employeeId
      @processingOptions = processingOptions
      @subsequentAuthInformation= subsequentAuthInformation
      @otherTax = otherTax
      @shipFrom = shipFrom
	  @authorizationIndicatorType = authorizationIndicatorType
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createTransactionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transactionRequest - TransactionRequestType
  class CreateTransactionRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :transactionRequest, as: TransactionRequestType

    def initialize(merchantAuthentication = nil, refId = nil, transactionRequest = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @transactionRequest = transactionRequest
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createTransactionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   transactionResponse - TransactionResponse
  #   profileResponse - CreateProfileResponse
  class CreateTransactionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :transactionResponse, as: TransactionResponse
    xml_accessor :profileResponse, as: CreateProfileResponse

    def initialize(refId = nil, messages = nil, sessionToken = nil, transactionResponse = nil, profileResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactionResponse = transactionResponse
      @profileResponse = profileResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileListItemType
  #   customerPaymentProfileId - SOAP::SOAPInt
  #   customerProfileId - SOAP::SOAPInt
  #   billTo - CustomerAddressType
  #   payment - PaymentMaskedType
  #   originalNetworkTransId - SOAP::SOAPString
  #   originalAuthAmount - SOAP::SOAPDecimal
  class CustomerPaymentProfileListItemType
    include ROXML
    xml_accessor :defaultPaymentProfile
    xml_accessor :customerPaymentProfileId
    xml_accessor :customerProfileId
    xml_accessor :billTo, as: CustomerAddressType
    xml_accessor :payment, as: PaymentMaskedType
	xml_accessor :originalNetworkTransId
	xml_accessor :originalAuthAmount
	

    def initialize(customerPaymentProfileId = nil, customerProfileId = nil, billTo = nil, payment = nil, defaultPaymentProfile = nil, originalNetworkTransId = nil, originalAuthAmount = nil)
      @customerPaymentProfileId = customerPaymentProfileId
      @customerProfileId = customerProfileId
      @billTo = billTo
      @payment = payment
      @defaultPaymentProfile = defaultPaymentProfile
	  @originalNetworkTransId = originalNetworkTransId
	  @originalAuthAmount = originalAuthAmount
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfCustomerPaymentProfileListItemType
  class ArrayOfCustomerPaymentProfileListItemType < ::Array
    include ROXML
    xml_accessor :paymentProfile, as: [CustomerPaymentProfileListItemType]

    def initialize(paymentProfile = [])
      @paymentProfile = paymentProfile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}CustomerPaymentProfileOrderFieldEnum
  class CustomerPaymentProfileOrderFieldEnum < ::String
    Id = CustomerPaymentProfileOrderFieldEnum.new("id")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}CustomerPaymentProfileSearchTypeEnum
  class CustomerPaymentProfileSearchTypeEnum < ::String
    CardsExpiringInMonth = CustomerPaymentProfileSearchTypeEnum.new("cardsExpiringInMonth")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}CustomerPaymentProfileSorting
  #   orderBy - CustomerPaymentProfileOrderFieldEnum
  #   orderDescending - SOAP::SOAPBoolean
  class CustomerPaymentProfileSorting
    include ROXML
    xml_accessor :orderBy
    xml_accessor :orderDescending

    def initialize(orderBy = nil, orderDescending = nil)
      @orderBy = orderBy
      @orderDescending = orderDescending
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileListRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   searchType - CustomerPaymentProfileSearchTypeEnum
  #   month - SOAP::SOAPString
  #   sorting - CustomerPaymentProfileSorting
  #   paging - Paging
  class GetCustomerPaymentProfileListRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :searchType
    xml_accessor :month
    xml_accessor :sorting, as: CustomerPaymentProfileSorting
    xml_accessor :paging, as: Paging

    def initialize(merchantAuthentication = nil, refId = nil, searchType = nil, month = nil, sorting = nil, paging = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @searchType = searchType
      @month = month
      @sorting = sorting
      @paging = paging
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileListResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   totalNumInResultSet - SOAP::SOAPInt
  #   paymentProfiles - ArrayOfCustomerPaymentProfileListItemType

  class GetCustomerPaymentProfileListResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :totalNumInResultSet
    xml_accessor :paymentProfiles, as: ArrayOfCustomerPaymentProfileListItemType

    def initialize(refId = nil, messages = nil, sessionToken = nil, totalNumInResultSet = nil, paymentProfiles = [])
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @totalNumInResultSet = totalNumInResultSet
      @paymentProfiles = paymentProfiles
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}subscriptionCustomerProfileType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerProfileId - (any)
  #   paymentProfile - CustomerPaymentProfileMaskedType
  #   shippingProfile - CustomerAddressExType
  class SubscriptionCustomerProfileType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :customerProfileId
    xml_accessor :paymentProfile, as: CustomerPaymentProfileMaskedType
    xml_accessor :shippingProfile, as: CustomerAddressExType

    def initialize(merchantCustomerId = nil, description = nil, email = nil, customerProfileId = nil, paymentProfile = nil, shippingProfile = nil)
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @customerProfileId = customerProfileId
      @paymentProfile = paymentProfile
      @shippingProfile = shippingProfile
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBSubscriptionMaskedType
  #   name - SOAP::SOAPString
  #   paymentSchedule - PaymentScheduleType
  #   amount - SOAP::SOAPDecimal
  #   trialAmount - SOAP::SOAPDecimal
  #   status - ARBSubscriptionStatusEnum
  #   profile - SubscriptionCustomerProfileType
  #   order - OrderType
  class ARBSubscriptionMaskedType
    include ROXML
    xml_accessor :name
    xml_accessor :paymentSchedule, as: PaymentScheduleType
    xml_accessor :amount, as: BigDecimal
    xml_accessor :trialAmount, as: BigDecimal
    xml_accessor :status
    xml_accessor :profile, as: SubscriptionCustomerProfileType
    xml_accessor :order, as: OrderType
    xml_accessor :arbTransactions, as: ARBTransactionList

    def initialize(name = nil, paymentSchedule = nil, amount = nil, trialAmount = nil, status = nil, profile = nil, order = nil, arbTransactions = nil)
      @name = name
      @paymentSchedule = paymentSchedule
      @amount = amount
      @trialAmount = trialAmount
      @status = status
      @profile = profile
      @order = order
      @arbTransactions = arbTransactions
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   subscriptionId - (any)
  #   includeTransactions - (any)
  class ARBGetSubscriptionRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :subscriptionId
    xml_accessor :includeTransactions

    def initialize(merchantAuthentication = nil, refId = nil, subscriptionId = nil, includeTransactions = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @subscriptionId = subscriptionId
      @includeTransactions = includeTransactions
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ARBGetSubscriptionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   subscription - ARBSubscriptionMaskedType
  class ARBGetSubscriptionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :subscription, as: ARBSubscriptionMaskedType

    def initialize(refId = nil, messages = nil, sessionToken = nil, subscription = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @subscription = subscription
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}AUResponseType
  class AUResponseType
    include ROXML
    xml_accessor :auReasonCode
    xml_accessor :profileCount
    xml_accessor :reasonDescription

    def initialize(auReasonCode = nil, profileCount = nil, reasonDescription = nil)
      @auReasonCode = auReasonCode
      @profileCount = profileCount
      @reasonDescription = reasonDescription
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfAUResponseType
  class ArrayOfAUResponseType < ::Array
    include ROXML
    xml_accessor :auResponse, as: [AUResponseType]

    def initialize(auResponse = [])
      @auResponse = auResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}AUUpdateType
  class AUUpdateType
    include ROXML
    xml_accessor :customerProfileID
    xml_accessor :customerPaymentProfileID
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :updateTimeUTC
    xml_accessor :auReasonCode
    xml_accessor :reasonDescription
    xml_accessor :newCreditCard, as: CreditCardMaskedType
    xml_accessor :oldCreditCard, as: CreditCardMaskedType

    def initialize(customerProfileID = nil, customerPaymentProfileID = nil, firstName = nil, lastName = nil, updateTimeUTC = nil, auReasonCode = nil, reasonDescription = nil, newCreditCard = nil, oldCreditCard = nil)
      @customerProfileID = customerProfileID
      @customerPaymentProfileID = customerPaymentProfileID
      @firstName = firstName
      @lastName = lastName
      @updateTimeUTC = updateTimeUTC
      @auReasonCode = auReasonCode
      @reasonDescription = reasonDescription
      @newCreditCard = newCreditCard
      @oldCreditCard = oldCreditCard
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}AUDeleteType
  class AUDeleteType
    include ROXML
    xml_accessor :customerProfileID
    xml_accessor :customerPaymentProfileID
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :updateTimeUTC
    xml_accessor :auReasonCode
    xml_accessor :reasonDescription
    xml_accessor :creditCard, as: CreditCardMaskedType

    def initialize(customerProfileID = nil, customerPaymentProfileID = nil, firstName = nil, lastName = nil, updateTimeUTC = nil, auReasonCode = nil, reasonDescription = nil, creditCard = nil)
      @customerProfileID = customerProfileID
      @customerPaymentProfileID = customerPaymentProfileID
      @firstName = firstName
      @lastName = lastName
      @updateTimeUTC = updateTimeUTC
      @auReasonCode = auReasonCode
      @reasonDescription = reasonDescription
      @creditCard = creditCard
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}AUDetailsType
  class AUDetailsType
    include ROXML
    xml_accessor :customerProfileID
    xml_accessor :customerPaymentProfileID
    xml_accessor :firstName
    xml_accessor :lastName
    xml_accessor :updateTimeUTC
    xml_accessor :auReasonCode
    xml_accessor :reasonDescription

    def initialize(customerProfileID = nil, customerPaymentProfileID = nil, firstName = nil, lastName = nil, updateTimeUTC = nil, auReasonCode = nil, reasonDescription = nil)
      @customerProfileID = customerProfileID
      @customerPaymentProfileID = customerPaymentProfileID
      @firstName = firstName
      @lastName = lastName
      @updateTimeUTC = updateTimeUTC
      @auReasonCode = auReasonCode
      @reasonDescription = reasonDescription
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ListOfAUDetailsType
  class ListOfAUDetailsType
    include ROXML
    xml_accessor :auUpdate, as: AUUpdateType
    xml_accessor :auDelete, as: AUDeleteType

    def initialize(auUpdate = nil, auDelete = nil)
      @auUpdate = auUpdate
      @auDelete = auDelete
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}AUJobTypeEnum
  class AUJobTypeEnum < ::String
    All = BankAccountTypeEnum.new("all")
    Updates = BankAccountTypeEnum.new("updates")
    Deletes = BankAccountTypeEnum.new("deletes")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}GetAUJobSummaryRequest
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   month - SOAP::SOAPString
  class GetAUJobSummaryRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :month

    def initialize(merchantAuthentication = nil, refId = nil, month = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @month = month
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}GetAUJobSummaryResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   auSummary - ARBSubscriptionMaskedType
  class GetAUJobSummaryResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :auSummary, as: ArrayOfAUResponseType

    def initialize(refId = nil, messages = nil, sessionToken = nil, auSummary = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @auSummary = auSummary
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}GetAUJobDetailsRequest
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   month - SOAP::SOAPString
  #   modifiedTypeFilter - AUJobTypeEnum
  #   paging - Paging
  class GetAUJobDetailsRequest
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :month
    xml_accessor :modifiedTypeFilter
    xml_accessor :paging, as: Paging

    def initialize(merchantAuthentication = nil, refId = nil, month = nil, modifiedTypeFilter = nil, paging = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @month = month
      @modifiedTypeFilter = modifiedTypeFilter
      @paging = paging
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}GetAUJobDetailsResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   totalNumInResultSet - ListOfAUDetailsType
  #   auDetails - SOAP::SOAPInt
  class GetAUJobDetailsResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :totalNumInResultSet, as: Integer
    xml_accessor :auDetails, as: [ListOfAUDetailsType]

    def initialize(refId = nil, messages = nil, sessionToken = nil, totalNumInResultSet = nil, auDetails = [])
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @totalNumInResultSet = totalNumInResultSet
      @auDetails = auDetails
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getMerchantDetailsRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class GetMerchantDetailsRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId

    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfCardType
  class ArrayOfCardType < ::Array
    include ROXML
    xml_accessor :cardType

    def initialize(cardType = [])
      @cardType = cardType
    end
 end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ProcessorType
  class ProcessorType
    include ROXML
    xml_accessor :name
    xml_accessor :id
    xml_accessor :cardTypes, as: [ArrayOfCardType]

    def initialize(name = nil, id = nil, cardTypes = nil)
      @name = name
      @id = id
      @cardTypes = cardTypes
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfProcessorType
  class ArrayOfProcessorType < ::Array
    include ROXML
    xml_accessor :processor, as: [ProcessorType]

    def initialize(processor = [])
      @processor = processor
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfMarketType
  class ArrayOfMarketType < ::Array
    include ROXML
    xml_accessor :marketType
    def initialize(marketType = [])
      @marketType = marketType
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfProductCode
  class ArrayOfProductCode < ::Array
    include ROXML
    xml_accessor :productCode

    def initialize(productCode = [])
      @productCode = productCode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}PaymentMethodsTypeEnum
  class PaymentMethodsTypeEnum < ::String
    Visa = PaymentMethodsTypeEnum.new("Visa")
    MasterCard = PaymentMethodsTypeEnum.new("MasterCard")
    Discover = PaymentMethodsTypeEnum.new("Discover")
    AmericanExpress = PaymentMethodsTypeEnum.new("AmericanExpress")
    DinersClub = PaymentMethodsTypeEnum.new("DinersClub")
    JCB = PaymentMethodsTypeEnum.new("JCB")
    EnRoute = PaymentMethodsTypeEnum.new("EnRoute")
    Echeck = PaymentMethodsTypeEnum.new("Echeck")
    Paypal = PaymentMethodsTypeEnum.new("Paypal")
    VisaCheckout = PaymentMethodsTypeEnum.new("VisaCheckout")
    ApplePay = PaymentMethodsTypeEnum.new("ApplePay")
    AndroidPay = PaymentMethodsTypeEnum.new("AndroidPay")
	GooglePay = PaymentMethodsTypeEnum.new("GooglePay")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfPaymentMethod
  class ArrayOfPaymentMethod < ::Array
    include ROXML
    xml_accessor :paymentMethod

    def initialize(paymentMethod = [])
      @paymentMethod = paymentMethod
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfCurrencyCode
  class ArrayOfCurrencyCode < ::Array
    include ROXML
    xml_accessor :currency

    def initialize(currency = [])
      @currency = currency
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getMerchantDetailsResponse
  class GetMerchantDetailsResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :isTestMode
    xml_accessor :processors, as: ArrayOfProcessorType
    xml_accessor :merchantName
    xml_accessor :gatewayId
    xml_accessor :marketTypes, as: ArrayOfMarketType
    xml_accessor :productCodes, as: ArrayOfProductCode
    xml_accessor :paymentMethods, as: ArrayOfPaymentMethod
    xml_accessor :currencies, as: ArrayOfCurrencyCode
    xml_accessor :publicClientKey
    xml_accessor :businessInformation, as: CustomerAddressType
    xml_accessor :merchantTimeZone
    xml_accessor :contactDetails, as: [ContactDetailType]

    def initialize(refId = nil, messages = nil, sessionToken = nil, isTestMode = nil, processors = nil, merchantName = nil, gatewayId = nil, marketTypes = nil, productCodes = nil, paymentMethods = nil, currencies = nil, publicClientKey = nil, businessInformation = nil, merchantTimeZone = nil, contactDetails=[])
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @isTestMode = isTestMode
      @processors = processors
      @merchantName = merchantName
      @gatewayId = gatewayId
      @marketTypes = marketTypes
      @productCodes = productCodes
      @paymentMethods = paymentMethods
      @currencies = currencies
      @publicClientKey = publicClientKey
      @businessInformation = businessInformation
      @merchantTimeZone = merchantTimeZone
      @contactDetails = contactDetails
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateMerchantDetailsRequest
  class UpdateMerchantDetailsRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :isTestMode

    def initialize(merchantAuthentication = nil, refId = nil, isTestMode = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @isTestMode = isTestMode
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileNonceRequest
  class GetCustomerPaymentProfileNonceRequest
    include ROXML
    xml_accessor :connectedAccessToken
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileId

    def initialize(connectedAccessToken = nil, customerProfileId = nil, customerPaymentProfileId = nil)
      @connectedAccessToken = connectedAccessToken
      @customerProfileId = customerProfileId
      @customerPaymentProfileId = customerPaymentProfileId
    end
  end

# {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileNonceResponse
class GetCustomerPaymentProfileNonceResponse
  include ROXML
  xml_accessor :messages, as: MessagesType
  xml_accessor :opaqueData, as: OpaqueDataType
  def initialize(messages = nil,opaqueData = nil)
    @messages = messages
    @opaqueData = opaqueData
  end
end
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateMerchantDetailsResponse
  class UpdateMerchantDetailsResponse
    include ROXML
    xml_accessor :merchantAuthentication, as: MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType

    def initialize(merchantAuthentication = nil, refId = nil, messages = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @messages = messages
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}PaymentMethodsTypeEnum
  class AfdsTransactionEnum < ::String
    Approve = AfdsTransactionEnum.new("approve")
    Decline = AfdsTransactionEnum.new("decline")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileTypeEnum
  class CustomerProfileTypeEnum < ::String
    Regular = CustomerProfileTypeEnum.new("regular")
    Guest = CustomerProfileTypeEnum.new("guest")
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}HeldTransactionRequestType
  class HeldTransactionRequestType
    include ROXML
    xml_accessor :action
    xml_accessor :refTransId

    def initialize(action = nil, refTransId = nil)
      @action = action
      @refTransId = refTransId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}UpdateHeldTransactionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class UpdateHeldTransactionRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :heldTransactionRequest, as: HeldTransactionRequestType

    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}UpdateHeldTransactionResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   transactionResponse - TransactionResponse
  #   profileResponse - CreateProfileResponse
  class UpdateHeldTransactionResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :transactionResponse, as: TransactionResponse

    def initialize(refId = nil, messages = nil, sessionToken = nil, transactionResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactionResponse = transactionResponse
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}GetHostedPaymentPageRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class GetHostedPaymentPageRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :transactionRequest, as: TransactionRequestType
    xml_accessor :hostedPaymentSettings, as: Settings

    def initialize(merchantAuthentication = nil, refId = nil, transactionRequest = nil, hostedPaymentSettings = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @transactionRequest = transactionRequest
      @hostedPaymentSettings = hostedPaymentSettings
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}GetHostedPaymentPageRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class GetHostedPaymentPageResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages, as: MessagesType
    xml_accessor :sessionToken
    xml_accessor :token

    def initialize(refId = nil, messages = nil, sessionToken = nil, token = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @token = token
    end
  end
end
