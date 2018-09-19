require 'logger'
require 'yaml'
require File.join File.dirname(__FILE__), 'SensitiveDataFilter'

module AuthorizeNet::API
class Log
    @@shouldLog = false
    @@loglevels = ['error','info','debug','warn']
    def initialize()
        begin	
	    filepath = './LogConfig.yml'
	    if(File.file?(filepath))
		cnf = YAML::load(File.open(filepath))
		if(@@loglevels.include? cnf['loglevel'].downcase)
			@@shouldLog = true
			@logger = Logger.new(cnf['filepath'])
			@logger.level = LogLevelMapper(cnf['loglevel'].downcase)
			if(cnf['maskSensitiveData'])
		            @logger.formatter = SensitiveDataFilter.new 
			else
      			      constants = YAML.load_file(File.dirname(__FILE__) + "/constants.yml")
			      @logger.formatter = proc do |severity, datetime, progname, msg|
			      progname = constants['clientId']
		              date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
			      if severity == "INFO" or severity == "WARN"
			      "[#{date_format}] #{severity}  (#{progname}): #{msg}\n"
			      else        
			      "[#{date_format}] #{severity} (#{progname}): #{msg}\n"
			      end
			   end
			end
		else
		    raise "Invalid log levels"
		end
	    else
		@@shouldLog = false
	    end
	rescue
       		@@shouldLog = false
	end
    end
    def info(message)
	if(@@shouldLog)
             begin 
		@logger.info message
             rescue Exception => ex
                ex
             end 
	end
    end
    def error(message)
	if(@@shouldLog)
             begin
		@logger.error message
             rescue Exception => ex
                ex
             end
	end
    end
    def fatal(message)
	if(@@shouldLog)
             begin
		@logger.fatal message
             rescue Exception => ex
                ex
             end
	end
    end
    def debug(message)
	if(@@shouldLog)
             begin
		@logger.debug message
             rescue Exception => ex
                ex
             end
	end
    end
    def LogLevelMapper(loglevel)
	case loglevel
        	when 'debug'
			Logger::DEBUG
		when 'error'
			Logger::ERROR
		when 'info'
			Logger::INFO
		when 'warn'
			Logger::WARN
		end
    end
end

class LogHelper
   def self.log
      Log.new
   end
end
end
