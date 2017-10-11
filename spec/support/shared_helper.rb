module SharedHelper
  def credentials
    $credentials ||= YAML.load_file(File.dirname(__FILE__) + "/../credentials.yml")
  rescue Errno::ENOENT
    warn "WARNING: Running w/o valid AuthorizeNet sandbox credentials. Create spec/credentials.yml."
  end
end
