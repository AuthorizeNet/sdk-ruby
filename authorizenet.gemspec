Gem::Specification.new do |s|
  s.name = "authorizenet"
  s.version = "1.8.0"
  s.platform = Gem::Platform::RUBY
  s.date = "2014-03-31"
  s.summary = "Authorize.Net Payments SDK"
  s.description = "Authorize.Net SDK includes standard payments, recurring billing, and customer profiles"
  s.authors = ["Authorize.Net"]
  s.email = "developer@authorize.net"
  s.files = Dir.glob("{lib}/**/*")
  s.homepage = "https://github.com/AuthorizeNet/sdk-ruby"
  s.license = "https://github.com/AuthorizeNet/sdk-ruby/blob/master/license.txt"
  s.add_runtime_dependency "nokogiri", "~> 1.4", ">= 1.4.3"
end
