require 'logger'

module AuthorizeNet::API
class SensitiveTag
	attr_accessor :tagName, :pattern, :replacement, :disableMask
	def initialize(tagName, pattern, replacement, disableMask)
		@tagName = tagName
		@pattern = pattern
		@replacement = replacement
		@disableMask = disableMask
	end
end

class SensitiveDataConfigType
	attr_accessor :sensitiveTags, :sensitiveStringRegexes
	def initialize
	@sensitiveTags = Array.new([SensitiveTag.new("cardCode", "", "XXX", false),
		      SensitiveTag.new("cardNumber", "(\\p{N}+)(\\p{N}{4})", "XXXX-\\2", false), 
		      SensitiveTag.new("expirationDate", "", "XXX", false),
		      SensitiveTag.new("accountNumber", "(\\p{N}+)(\\p{N}{4})", "XXXX-\\2", false),
		      SensitiveTag.new("nameOnAccount", "", "XXX", false),
		      SensitiveTag.new("transactionKey", "", "XXX", false)]).freeze
	@sensitiveStringRegexes = ["4\\p{N}{3}([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
			          "4\\p{N}{3}([\\ \\-]?)(?:\\p{N}{4}\\1){2}\\p{N}(?:\\p{N}{3})?",
            			  "5[1-5]\\p{N}{2}([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
		                  "6(?:011|22(?:1(?=[\\ \\-]?(?:2[6-9]|[3-9]))|[2-8]|9(?=[\\ \\-]?(?:[01]|2[0-5])))|4[4-9]\\p{N}|5\\p{N}\\p{N})([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
		                  "35(?:2[89]|[3-8]\\p{N})([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
		                  "3[47]\\p{N}\\p{N}([\\ \\-]?)\\p{N}{6}\\1\\p{N}{5}"].freeze
	end
end

class SensitiveDataFilter < Logger::Formatter
        @@sensitiveTagConfig = nil
	@@tagPatterns = nil
	@@tagReplacements = nil
	@@cardPatterns = nil

        def initialize
	    @@sensitiveTagConfig = SensitiveDataConfigType.new
	    @@cardPatterns       = @@sensitiveTagConfig.sensitiveStringRegexes
            @@tagPatterns        = Array.new(@@sensitiveTagConfig.sensitiveStringRegexes.length)
	    @@tagReplacements    = Array.new(@@sensitiveTagConfig.sensitiveTags.length)

	    @@sensitiveTagConfig.sensitiveTags.each_with_index do |sensitiveTag, index|
	    tagName = sensitiveTag.tagName
	    replacement = sensitiveTag.replacement

		    if sensitiveTag.pattern.nil? || sensitiveTag.pattern.empty?
	  	       pattern = "(.*)"
		    else
		       pattern = sensitiveTag.pattern
		    end

	    @@tagPatterns[index] = "<"+tagName+">"+pattern+"</"+tagName+">"
	    @@tagReplacements[index] = "<"+tagName+">"+replacement+"</"+tagName+">"
	    end
        end

        def call(severity, time, progname, msg)
            xmlMaskedLog = maskSensitiveXmlString(msg)
            ccMasked = maskCreditCards(xmlMaskedLog)
	    return formatLogEntry(severity, time, progname, ccMasked)
        end

        def maskCreditCards(input)
	    input = input.force_encoding("UTF-8")
	    @@cardPatterns.each {|cardNumberRegex| 
	    input = input.gsub(/#{cardNumberRegex}/, "XXX")
	    }
            return input
        end

	def maskSensitiveXmlString(input)
	    input = input.force_encoding("UTF-8")
            @@tagPatterns.each_with_index do |item, index| 
		 input = input.gsub(/#{item}/,@@tagReplacements[index])
            end
            return input
	end

	def formatLogEntry(severity, time, progname, msg)
              constants = YAML.load_file(File.dirname(__FILE__) + "/constants.yml")
	      progname = constants['clientId']
              date_format = time.strftime("%Y-%m-%d %H:%M:%S")
	      if severity == "INFO" or severity == "WARN"
	      "[#{date_format}] #{severity}  (#{progname}): #{msg}\n"
	      else        
	      "[#{date_format}] #{severity} (#{progname}): #{msg}\n"
	      end
        end
end
end
