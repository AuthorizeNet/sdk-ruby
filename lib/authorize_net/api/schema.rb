require 'xsd/qname'
require 'roxml'

module AuthorizeNet::API
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfLong
  class ArrayOfLong < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfNumericString
  class ArrayOfNumericString < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfString
  class ArrayOfString < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfBatchStatisticType
  class ArrayOfBatchStatisticType < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfBatchDetailsType
  class ArrayOfBatchDetailsType < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfTransactionSummaryType
  class ArrayOfTransactionSummaryType < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfSetting
  class ArrayOfSetting < ::Array
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}emailSettingsType
  #   setting - SettingType
  #   xmlattr_version - SOAP::SOAPInteger
  class EmailSettingsType
    include ROXML
    AttrVersion = XSD::QName.new(nil, "version")
  
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
    xml_accessor :customerAddressId
  
    def initialize(firstName = nil, lastName = nil, company = nil, address = nil, city = nil, state = nil, zip = nil, country = nil, phoneNumber = nil, faxNumber = nil, customerAddressId = nil)
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}transRetailInfoType
  #   marketType - SOAP::SOAPString
  #   deviceType - SOAP::SOAPString
  class TransRetailInfoType
    include ROXML
    xml_accessor :marketType
    xml_accessor :deviceType
  
    def initialize(marketType = nil, deviceType = nil)
      @marketType = marketType
      @deviceType = deviceType
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}creditCardSimpleType
  #   cardNumber - SOAP::SOAPString
  #   expirationDate - SOAP::SOAPString
  #   paymentToken - SOAP::SOAPBoolean
  class CreditCardSimpleType
    include ROXML
    xml_accessor :cardNumber
    xml_accessor :expirationDate
    xml_accessor :paymentToken
  
    def initialize(cardNumber = nil, expirationDate = nil, paymentToken = nil)
      @cardNumber = cardNumber
      @expirationDate = expirationDate
      @paymentToken = paymentToken
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}creditCardType
  #   cardNumber - SOAP::SOAPString
  #   expirationDate - SOAP::SOAPString
  #   paymentToken - SOAP::SOAPBoolean
  #   cardCode - (any)
  class CreditCardType
    include ROXML
    xml_accessor :cardNumber
    xml_accessor :expirationDate
    xml_accessor :paymentToken
    xml_accessor :cardCode
  
    def initialize(cardNumber = nil, expirationDate = nil, paymentToken = nil, cardCode = nil)
      @cardNumber = cardNumber
      @expirationDate = expirationDate
      @paymentToken = paymentToken
      @cardCode = cardCode
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
  class CreditCardMaskedType
    include ROXML
    xml_accessor :cardNumber
    xml_accessor :expirationDate
    xml_accessor :cardType
  
    def initialize(cardNumber = nil, expirationDate = nil, cardType = nil)
      @cardNumber = cardNumber
      @expirationDate = expirationDate
      @cardType = cardType
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
  class OpaqueDataType
    include ROXML
    xml_accessor :dataDescriptor
    xml_accessor :dataValue
  
    def initialize(dataDescriptor = nil, dataValue = nil)
      @dataDescriptor = dataDescriptor
      @dataValue = dataValue
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
        xml_accessor :pIN
        xml_accessor :data
  
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
        xml_accessor :description
  
        def initialize(description = nil)
          @description = description
        end
      end
  
      # inner class for member: EncryptedData
      # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}EncryptedData
      #   value - SOAP::SOAPString
      class EncryptedData
        include ROXML
        xml_accessor :value
  
        def initialize(value = nil)
          @value = value
        end
      end
  
      xml_accessor :operation#, :as => OperationType
      xml_accessor :mode, :as => Mode
      xml_accessor :deviceInfo, :as => DeviceInfo
      xml_accessor :encryptedData, :as => EncryptedData
  
      def initialize(operation = nil, mode = nil, deviceInfo = nil, encryptedData = nil)
        @operation = operation
        @mode = mode
        @deviceInfo = deviceInfo
        @encryptedData = encryptedData
      end
    end
  
    xml_accessor :dUKPT, :as => DUKPT
  
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
    xml_accessor :encoding#, :as => EncodingType
    xml_accessor :encryptionAlgorithm#, :as => EncryptionAlgorithmType
    xml_accessor :scheme, :as => KeyManagementScheme
  
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
    xml_accessor :value, :as => KeyValue
  
    def initialize(value = nil)
      @value = value
    end
  end

  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}encryptedTrackDataType
  #   formOfPayment - KeyBlock
  class EncryptedTrackDataType
    include ROXML
    xml_accessor :formOfPayment, :as => KeyBlock
  
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
  class PaymentType
    include ROXML
    xml_accessor :creditCard, :as => CreditCardType
    xml_accessor :bankAccount, :as => BankAccountType
    xml_accessor :trackData, :as => CreditCardTrackType
    xml_accessor :encryptedTrackData, :as => EncryptedTrackDataType
    xml_accessor :payPal, :as => PayPalType
    xml_accessor :opaqueData, :as => OpaqueDataType
  
    def initialize(creditCard = nil, bankAccount = nil, trackData = nil, encryptedTrackData = nil, payPal = nil, opaqueData = nil)
      @creditCard = creditCard
      @bankAccount = bankAccount
      @trackData = trackData
      @encryptedTrackData = encryptedTrackData
      @payPal = payPal
      @opaqueData = opaqueData
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}paymentMaskedType
  #   creditCard - CreditCardMaskedType
  #   bankAccount - BankAccountMaskedType
  #   tokenInformation - TokenMaskedType
  class PaymentMaskedType
    include ROXML
    xml_accessor :creditCard
    xml_accessor :bankAccount
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
  class TokenMaskedType
    include ROXML
    xml_accessor :tokenSource
    xml_accessor :tokenNumber
    xml_accessor :expirationDate
  
    def initialize(tokenSource = nil, tokenNumber = nil, expirationDate = nil)
      @tokenSource = tokenSource
      @tokenNumber = tokenNumber
      @expirationDate = expirationDate
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}orderType
  #   invoiceNumber - SOAP::SOAPString
  #   description - SOAP::SOAPString
  class OrderType
    include ROXML
    xml_accessor :invoiceNumber
    xml_accessor :description
  
    def initialize(invoiceNumber = nil, description = nil)
      @invoiceNumber = invoiceNumber
      @description = description
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
    xml_accessor :driversLicense, :as => DriversLicenseType
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
  class FingerPrintType
    include ROXML
    xml_accessor :hashValue
    xml_accessor :sequence
    xml_accessor :timestamp
  
    def initialize(hashValue = nil, sequence = nil, timestamp = nil)
      @hashValue = hashValue
      @sequence = sequence
      @timestamp = timestamp
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
  class MerchantAuthenticationType
    include ROXML
    xml_accessor :name
    xml_accessor :transactionKey
    xml_accessor :sessionToken
    xml_accessor :password
    xml_accessor :impersonationAuthentication, :as => ImpersonationAuthenticationType
    xml_accessor :fingerPrint, :as => FingerPrintType
    xml_accessor :mobileDeviceId
  
    def initialize(name = nil, transactionKey = nil, sessionToken = nil, password = nil, impersonationAuthentication = nil, fingerPrint = nil, mobileDeviceId = nil)
      @name = name
      @transactionKey = transactionKey
      @sessionToken = sessionToken
      @password = password
      @impersonationAuthentication = impersonationAuthentication
      @fingerPrint = fingerPrint
      @mobileDeviceId = mobileDeviceId
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
  
    xml_accessor :interval
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
  class ARBSubscriptionType
    include ROXML
    xml_accessor :name
    xml_accessor :paymentSchedule
    xml_accessor :amount
    xml_accessor :trialAmount
    xml_accessor :payment
    xml_accessor :order
    xml_accessor :customer
    xml_accessor :billTo
    xml_accessor :shipTo
  
    def initialize(name = nil, paymentSchedule = nil, amount = nil, trialAmount = nil, payment = nil, order = nil, customer = nil, billTo = nil, shipTo = nil)
      @name = name
      @paymentSchedule = paymentSchedule
      @amount = amount
      @trialAmount = trialAmount
      @payment = payment
      @order = order
      @customer = customer
      @billTo = billTo
      @shipTo = shipTo
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}fingerPrintSupportInformationType
  #   amount - SOAP::SOAPDecimal
  #   currencyCode - SOAP::SOAPString
  #   sequence - SOAP::SOAPString
  #   timestamp - SOAP::SOAPString
  class FingerPrintSupportInformationType
    include ROXML
    xml_accessor :amount
    xml_accessor :currencyCode
    xml_accessor :sequence
    xml_accessor :timestamp
  
    def initialize(amount = nil, currencyCode = nil, sequence = nil, timestamp = nil)
      @amount = amount
      @currencyCode = currencyCode
      @sequence = sequence
      @timestamp = timestamp
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
    xml_accessor :settings, :as => [SettingType]
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
    xml_accessor :userFields, :as => [UserField]
    
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  #   payment - PaymentType
  #   driversLicense - DriversLicenseType
  #   taxId - SOAP::SOAPString
  class CustomerPaymentProfileType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo
    xml_accessor :payment
    xml_accessor :driversLicense
    xml_accessor :taxId
  
    def initialize(customerType = nil, billTo = nil, payment = nil, driversLicense = nil, taxId = nil)
      @customerType = customerType
      @billTo = billTo
      @payment = payment
      @driversLicense = driversLicense
      @taxId = taxId
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileExType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  #   payment - PaymentType
  #   driversLicense - DriversLicenseType
  #   taxId - SOAP::SOAPString
  #   customerPaymentProfileId - (any)
  class CustomerPaymentProfileExType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo
    xml_accessor :payment
    xml_accessor :driversLicense
    xml_accessor :taxId
    xml_accessor :customerPaymentProfileId
  
    def initialize(customerType = nil, billTo = nil, payment = nil, driversLicense = nil, taxId = nil, customerPaymentProfileId = nil)
      @customerType = customerType
      @billTo = billTo
      @payment = payment
      @driversLicense = driversLicense
      @taxId = taxId
      @customerPaymentProfileId = customerPaymentProfileId
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerPaymentProfileMaskedType
  #   customerType - CustomerTypeEnum
  #   billTo - CustomerAddressType
  #   customerPaymentProfileId - (any)
  #   payment - PaymentMaskedType
  #   driversLicense - DriversLicenseMaskedType
  #   taxId - SOAP::SOAPString
  class CustomerPaymentProfileMaskedType
    include ROXML
    xml_accessor :customerType
    xml_accessor :billTo
    xml_accessor :customerPaymentProfileId
    xml_accessor :payment
    xml_accessor :driversLicense
    xml_accessor :taxId
  
    def initialize(customerType = nil, billTo = nil, customerPaymentProfileId = nil, payment = nil, driversLicense = nil, taxId = nil)
      @customerType = customerType
      @billTo = billTo
      @customerPaymentProfileId = customerPaymentProfileId
      @payment = payment
      @driversLicense = driversLicense
      @taxId = taxId
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
  class CustomerProfileType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :paymentProfiles
    xml_accessor :shipToList
  
    def initialize(merchantCustomerId = nil, description = nil, email = nil, paymentProfiles = [], shipToList = [])
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @paymentProfiles = paymentProfiles
      @shipToList = shipToList
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}customerProfileMaskedType
  #   merchantCustomerId - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   email - SOAP::SOAPString
  #   customerProfileId - (any)
  #   paymentProfiles - CustomerPaymentProfileMaskedType
  #   shipToList - CustomerAddressExType
  class CustomerProfileMaskedType
    include ROXML
    xml_accessor :merchantCustomerId
    xml_accessor :description
    xml_accessor :email
    xml_accessor :customerProfileId
    xml_accessor :paymentProfiles
    xml_accessor :shipToList
  
    def initialize(merchantCustomerId = nil, description = nil, email = nil, customerProfileId = nil, paymentProfiles = [], shipToList = [])
      @merchantCustomerId = merchantCustomerId
      @description = description
      @email = email
      @customerProfileId = customerProfileId
      @paymentProfiles = paymentProfiles
      @shipToList = shipToList
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}extendedAmountType
  #   amount - SOAP::SOAPDecimal
  #   name - SOAP::SOAPString
  #   description - SOAP::SOAPString
  class ExtendedAmountType
    include ROXML
    xml_accessor :amount, :as => BigDecimal
    xml_accessor :name
    xml_accessor :description
  
    def initialize(amount = nil, name = nil, description = nil)
      @amount = amount
      @name = name
      @description = description
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}lineItemType
  #   itemId - SOAP::SOAPString
  #   name - SOAP::SOAPString
  #   description - SOAP::SOAPString
  #   quantity - SOAP::SOAPDecimal
  #   unitPrice - SOAP::SOAPDecimal
  #   taxable - SOAP::SOAPBoolean
  class LineItemType
    include ROXML
    xml_accessor :itemId
    xml_accessor :name
    xml_accessor :description
    xml_accessor :quantity, :as => BigDecimal
    xml_accessor :unitPrice, :as => BigDecimal
    xml_accessor :taxable
  
    def initialize(itemId = nil, name = nil, description = nil, quantity = nil, unitPrice = nil, taxable = nil)
      @itemId = itemId
      @name = name
      @description = description
      @quantity = quantity
      @unitPrice = unitPrice
      @taxable = taxable
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfLineItem
  class LineItems
    include ROXML
    xml_accessor :lineItems, :as => [LineItemType]
    
    def initialize(lineItems = [])
     @lineItems = lineItems
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
    xml_accessor :subscription
    xml_accessor :hasReturnedItems
  
    def initialize(transId = nil, submitTimeUTC = nil, submitTimeLocal = nil, transactionStatus = nil, invoiceNumber = nil, firstName = nil, lastName = nil, accountType = nil, accountNumber = nil, settleAmount = nil, marketType = nil, product = nil, mobileDeviceId = nil, subscription = nil, hasReturnedItems = nil)
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
  #   aVSResponse - SOAP::SOAPString
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
  class TransactionDetailsType
    include ROXML
    xml_accessor :transId
    xml_accessor :refTransId
    xml_accessor :splitTenderId
    xml_accessor :submitTimeUTC
    xml_accessor :submitTimeLocal
    xml_accessor :transactionType
    xml_accessor :transactionStatus
    xml_accessor :responseCode
    xml_accessor :responseReasonCode
    xml_accessor :subscription
    xml_accessor :responseReasonDescription
    xml_accessor :authCode
    xml_accessor :aVSResponse
    xml_accessor :cardCodeResponse
    xml_accessor :cAVVResponse
    xml_accessor :fDSFilterAction
    xml_accessor :fDSFilters
    xml_accessor :batch
    xml_accessor :order
    xml_accessor :requestedAmount
    xml_accessor :authAmount
    xml_accessor :settleAmount
    xml_accessor :tax
    xml_accessor :shipping
    xml_accessor :duty
    xml_accessor :lineItems
    xml_accessor :prepaidBalanceRemaining
    xml_accessor :taxExempt
    xml_accessor :payment
    xml_accessor :customer
    xml_accessor :billTo
    xml_accessor :shipTo
    xml_accessor :recurringBilling
    xml_accessor :customerIP
    xml_accessor :product
    xml_accessor :marketType
    xml_accessor :mobileDeviceId
    xml_accessor :returnedItems
    xml_accessor :solution
  
    def initialize(transId = nil, refTransId = nil, splitTenderId = nil, submitTimeUTC = nil, submitTimeLocal = nil, transactionType = nil, transactionStatus = nil, responseCode = nil, responseReasonCode = nil, subscription = nil, responseReasonDescription = nil, authCode = nil, aVSResponse = nil, cardCodeResponse = nil, cAVVResponse = nil, fDSFilterAction = nil, fDSFilters = nil, batch = nil, order = nil, requestedAmount = nil, authAmount = nil, settleAmount = nil, tax = nil, shipping = nil, duty = nil, lineItems = nil, prepaidBalanceRemaining = nil, taxExempt = nil, payment = nil, customer = nil, billTo = nil, shipTo = nil, recurringBilling = nil, customerIP = nil, product = nil, marketType = nil, mobileDeviceId = nil, returnedItems = nil, solution = nil)
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
      @aVSResponse = aVSResponse
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfReturnedItem
  class ArrayOfReturnedItem < ::Array
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
    xml_accessor :statistics
  
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
  #   secureAcceptance - TransactionResponse::SecureAcceptance
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
    class Messages < ::Array
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
    end
  
    # inner class for member: errors
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}errors
    class Errors < ::Array
  
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
    end
  
    # inner class for member: splitTenderPayments
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}splitTenderPayments
    class SplitTenderPayments < ::Array
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
    end
  
    # inner class for member: userFields
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}userFields
    class UserFields < ::Array
    end
  
    # inner class for member: secureAcceptance
    # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}secureAcceptance
    #   secureAcceptanceUrl - SOAP::SOAPString
    #   payerID - SOAP::SOAPString
    class SecureAcceptance
      include ROXML
      xml_accessor :secureAcceptanceUrl
      xml_accessor :payerID
  
      def initialize(secureAcceptanceUrl = nil, payerID = nil)
        @secureAcceptanceUrl = secureAcceptanceUrl
        @payerID = payerID
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
    xml_accessor :prePaidCard
    xml_accessor :messages, :as => [Messages::Message]
    xml_accessor :errors, :as => [Errors::Error]
    xml_accessor :splitTenderPayments
    xml_accessor :userFields
    xml_accessor :shipTo
    xml_accessor :secureAcceptance
  
    def initialize(responseCode = nil, rawResponseCode = nil, authCode = nil, avsResultCode = nil, cvvResultCode = nil, cavvResultCode = nil, transId = nil, refTransID = nil, transHash = nil, testRequest = nil, accountNumber = nil, accountType = nil, splitTenderId = nil, prePaidCard = nil, messages = nil, errors = nil, splitTenderPayments = nil, userFields = nil, shipTo = nil, secureAcceptance = nil)
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
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ANetApiRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class ANetApiRequest
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
  
    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
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
  
    xml_accessor :resultCode#, :as => MessageTypeEnum
    xml_accessor :message, :as => [MessagesType::Message]
  
    def initialize(resultCode = nil, message = [])
      @resultCode = resultCode
      @message = message
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ANetApiResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class ANetApiResponse
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
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
    xml_accessor :messages
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileIdList
    xml_accessor :customerShippingAddressIdList
  
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}ArrayOfSubscription
  class ArrayOfSubscription < ::Array
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
  
    def initialize(id = nil, name = nil, status = nil, createTimeStampUTC = nil, firstName = nil, lastName = nil, totalOccurrences = nil, pastOccurrences = nil, paymentMethod = nil, accountNumber = nil, invoice = nil, amount = nil, currencyCode = nil)
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
    xml_accessor :paymentProfileId
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
    xml_accessor :customerProfileId
    xml_accessor :paymentProfile, :as => PaymentProfile
    xml_accessor :shippingProfileId
  
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
    HostedProfileHeadingBgColor = SettingNameEnum.new("hostedProfileHeadingBgColor")
    HostedProfileIFrameCommunicatorUrl = SettingNameEnum.new("hostedProfileIFrameCommunicatorUrl")
    HostedProfilePageBorderVisible = SettingNameEnum.new("hostedProfilePageBorderVisible")
    HostedProfileReturnUrl = SettingNameEnum.new("hostedProfileReturnUrl")
    HostedProfileReturnUrlText = SettingNameEnum.new("hostedProfileReturnUrlText")
    HostedProfileValidationMode = SettingNameEnum.new("hostedProfileValidationMode")
    MerchantEmail = SettingNameEnum.new("merchantEmail")
    RecurringBilling = SettingNameEnum.new("recurringBilling")
    TestRequest = SettingNameEnum.new("testRequest")
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :subscription
  
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
  class ARBCreateSubscriptionResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :subscriptionId
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, subscriptionId = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @subscriptionId = subscriptionId
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
    xml_accessor :subscription
  
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
  class ARBUpdateSubscriptionResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
  
    def initialize(refId = nil, messages = nil, sessionToken = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :profile
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :customerProfileId
    xml_accessor :customerPaymentProfileIdList
    xml_accessor :customerShippingAddressIdList
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
    xml_accessor :paymentProfile
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
  #   customerPaymentProfileId - (any)
  #   validationDirectResponse - SOAP::SOAPString
  class CreateCustomerPaymentProfileResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :customerPaymentProfileId
    xml_accessor :validationDirectResponse
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, customerPaymentProfileId = nil, validationDirectResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
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
    xml_accessor :address
  
    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, address = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @address = address
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerShippingAddressResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   customerAddressId - (any)
  class CreateCustomerShippingAddressResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :customerAddressId
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, customerAddressId = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @customerAddressId = customerAddressId
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createCustomerProfileFromTransactionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transId - (any)
  class CreateCustomerProfileFromTransactionRequest 
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  class GetCustomerProfileRequest 
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
  
    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   profile - CustomerProfileMaskedType
  class GetCustomerProfileResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :profile
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, profile = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @profile = profile
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   customerPaymentProfileId - (any)
  class GetCustomerPaymentProfileRequest 
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
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getCustomerPaymentProfileResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   paymentProfile - CustomerPaymentProfileMaskedType
  class GetCustomerPaymentProfileResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :paymentProfile
  
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
  class GetCustomerShippingAddressResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :address
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, address = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @address = address
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
    xml_accessor :profile
  
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
    xml_accessor :messages
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
    xml_accessor :paymentProfile
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
    xml_accessor :messages
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
    xml_accessor :address
  
    def initialize(merchantAuthentication = nil, refId = nil, customerProfileId = nil, address = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @customerProfileId = customerProfileId
      @address = address
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}updateCustomerShippingAddressResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  class UpdateCustomerShippingAddressResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
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
    xml_accessor :merchantAuthentication
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :ids
  
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
    xml_accessor :messages
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
  class GetTransactionDetailsResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :transaction
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, transaction = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transaction = transaction
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createFingerPrintRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   supportInformation - FingerPrintSupportInformationType
  class CreateFingerPrintRequest 
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :supportInformation
  
    def initialize(merchantAuthentication = nil, refId = nil, supportInformation = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @supportInformation = supportInformation
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createFingerPrintResponse
  #   refId - SOAP::SOAPString
  #   messages - MessagesType
  #   sessionToken - SOAP::SOAPString
  #   fingerPrint - FingerPrintType
  #   supportInformation - FingerPrintSupportInformationType
  class CreateFingerPrintResponse 
    include ROXML
    xml_accessor :refId
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :fingerPrint
    xml_accessor :supportInformation
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, fingerPrint = nil, supportInformation = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @fingerPrint = fingerPrint
      @supportInformation = supportInformation
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :batch
  
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :batchList
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, batchList = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @batchList = batchList
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
  
    def initialize(merchantAuthentication = nil, refId = nil, batchId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
      @batchId = batchId
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :transactions
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, transactions = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactions = transactions
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getHostedProfilePageRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   customerProfileId - (any)
  #   hostedProfileSettings - ArrayOfSetting
  class GetHostedProfilePageRequest 
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
    xml_accessor :customerProfileId
    xml_accessor :hostedProfileSettings
  
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :token
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, token = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @token = token
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}getUnsettledTransactionListRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  class GetUnsettledTransactionListRequest 
    include ROXML
    xml_accessor :merchantAuthentication
    xml_accessor :refId
  
    def initialize(merchantAuthentication = nil, refId = nil)
      @merchantAuthentication = merchantAuthentication
      @refId = refId
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :transactions
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, transactions = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactions = transactions
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :messages
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
    xml_accessor :sorting
    xml_accessor :paging
  
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
    xml_accessor :messages
    xml_accessor :sessionToken
    xml_accessor :totalNumInResultSet
    xml_accessor :subscriptionDetails
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, totalNumInResultSet = nil, subscriptionDetails = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @totalNumInResultSet = totalNumInResultSet
      @subscriptionDetails = subscriptionDetails
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
  #   transactionSettings - ArrayOfSetting
  #   userFields - TransactionRequestType::UserFields
  class TransactionRequestType
    include ROXML 
    xml_accessor :transactionType
    xml_accessor :amount, :as => BigDecimal
    xml_accessor :currencyCode
    xml_accessor :payment, :as => PaymentType
    xml_accessor :profile, :as => CustomerProfilePaymentType
    xml_accessor :solution, :as => SolutionType
    xml_accessor :authCode
    xml_accessor :refTransId
    xml_accessor :splitTenderId
    xml_accessor :order, :as => OrderType
    xml_accessor :lineItems, :as => LineItems
    xml_accessor :tax, :as => ExtendedAmountType
    xml_accessor :duty, :as => ExtendedAmountType
    xml_accessor :shipping, :as => ExtendedAmountType
    xml_accessor :taxExempt
    xml_accessor :poNumber
    xml_accessor :customer, :as => CustomerDataType
    xml_accessor :billTo, :as => CustomerAddressType
    xml_accessor :shipTo, :as => NameAndAddressType
    xml_accessor :customerIP
    xml_accessor :cardholderAuthentication, :as => CcAuthenticationType
    xml_accessor :retail, :as => TransRetailInfoType
    xml_accessor :transactionSettings, :as => Settings
    xml_accessor :userFields, :as => UserFields
  
    def initialize(transactionType = nil, amount = nil, currencyCode = nil, payment = nil, profile = nil, solution = nil, authCode = nil, refTransId = nil, splitTenderId = nil, order = nil, lineItems = nil, tax = nil, duty = nil, shipping = nil, taxExempt = nil, poNumber = nil, customer = nil, billTo = nil, shipTo = nil, customerIP = nil, cardholderAuthentication = nil, retail = nil, transactionSettings = nil, userFields = nil)
      @transactionType = transactionType
      @amount = amount
      @currencyCode = currencyCode
      @payment = payment
      @profile = profile
      @solution = solution
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
    end
  end
  
  # {AnetApi/xml/v1/schema/AnetApiSchema.xsd}createTransactionRequest
  #   merchantAuthentication - MerchantAuthenticationType
  #   refId - SOAP::SOAPString
  #   transactionRequest - TransactionRequestType
  class CreateTransactionRequest 
    include ROXML
    xml_accessor :merchantAuthentication, :as => MerchantAuthenticationType
    xml_accessor :refId
    xml_accessor :transactionRequest, :as => TransactionRequestType
  
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
    xml_accessor :messages, :as => MessagesType
    xml_accessor :sessionToken
    xml_accessor :transactionResponse, :as => TransactionResponse
    xml_accessor :profileResponse
  
    def initialize(refId = nil, messages = nil, sessionToken = nil, transactionResponse = nil, profileResponse = nil)
      @refId = refId
      @messages = messages
      @sessionToken = sessionToken
      @transactionResponse = transactionResponse
      @profileResponse = profileResponse
    end
  end
end
