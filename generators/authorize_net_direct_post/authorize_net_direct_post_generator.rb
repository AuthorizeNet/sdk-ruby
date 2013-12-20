require File.join(File.dirname(__FILE__), '..', 'generator_extensions.rb')

class AuthorizeNetDirectPostGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.file "README-AuthorizeNet", "README-AuthorizeNet"
      m.directory "app/views/#{file_name}"
      m.file "payment.erb", "app/views/#{file_name}/payment.erb"
      m.file "receipt.erb", "app/views/#{file_name}/receipt.erb"
      m.file "relay_response.erb", "app/views/#{file_name}/relay_response.erb"
      m.file "layout.erb", "app/views/layouts/authorize_net.erb"
      m.template "config.yml.erb", "config/authorize_net.yml"
      m.file "initializer.rb", "config/initializers/authorize_net.rb"
      m.template "controller.rb.erb", "app/controllers/#{file_name}_controller.rb"
      m.route :name => "#{singular_name}_receipt", :path => "/#{plural_name}/receipt", :controller => file_name, :action => 'receipt', :conditions => "{:method => :get}"
      m.route :name => "#{singular_name}_relay_response", :path => "/#{plural_name}/relay_response", :controller => file_name, :action => 'relay_response', :conditions => "{:method => :post}"
      m.route :name => "#{singular_name}_payment", :path => "/#{plural_name}/payment", :controller => file_name, :action => 'payment', :conditions => "{:method => :get}"
      m.gem :name => 'authorize-net'
    end
  end
end
