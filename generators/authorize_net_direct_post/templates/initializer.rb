yml = YAML.load_file("#{RAILS_ROOT}/config/authorize_net.yml")
AUTHORIZE_NET_CONFIG = yml['default']
AUTHORIZE_NET_CONFIG.merge!(yml[RAILS_ENV]) unless yml[RAILS_ENV].nil?
AUTHORIZE_NET_CONFIG.freeze
