require 'erb'
require 'yaml'

module SharedHelper
  def credentials
    $credentials ||= YAML.load(ERB.new(File.read "#{__dir__}/../credentials.yml").result)
  rescue Errno::ENOENT
    warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
  end
end
