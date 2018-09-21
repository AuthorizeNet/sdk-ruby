require 'logger'
require 'yaml'
require File.join File.dirname(__FILE__), 'SensitiveDataFilter'

module AuthorizeNet::API
class Log
    ANET_LOG_DEBUG = 1;
    ANET_LOG_INFO  = 2;
    ANET_LOG_WARN  = 3;
    ANET_LOG_ERROR = 4;

    @@shouldLog = false
    @@loglevels = ['debug','info','warn','error']
    @@logLevel  = ANET_LOG_ERROR;

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
    def debug(message)
	if(@@shouldLog)
             begin
                if(@@logLevel <= ANET_LOG_DEBUG)
		   @logger.debug message
                end
             rescue Exception => ex
                ex
             end
	end
    end
    def info(message)
	if(@@shouldLog)
             begin 
                if(@@logLevel <= ANET_LOG_INFO)
                   @logger.info message
                end
             rescue Exception => ex
                ex
             end 
	end
    end
    def warn(message)
	if(@@shouldLog)
             begin
                if(@@logLevel <= ANET_LOG_WARN)
		   @logger.warn message
                end
             rescue Exception => ex
                ex
             end
	end
    end
    def error(message)
	if(@@shouldLog)
             begin
                if(@@logLevel <= ANET_LOG_ERROR)
		   @logger.error message
                end
             rescue Exception => ex
                ex
             end
	end
    end
    def LogLevelMapper(loglevel)
	case loglevel
        	when 'debug'
			@@logLevel = ANET_LOG_DEBUG
			return Logger::DEBUG
		when 'info'
			@@logLevel = ANET_LOG_INFO
			return Logger::INFO
		when 'warn'
			@@logLevel = ANET_LOG_WARN
			return Logger::WARN
		when 'error'
			@@logLevel = ANET_LOG_ERROR
			return Logger::ERROR
		end
    end
end

class LogHelper
   def self.log
      Log.new
   end
end
end
