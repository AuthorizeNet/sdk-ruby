require File.join(File.dirname(__FILE__), '..', 'generator_extensions.rb')

class AuthorizeNetSimGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.file "README-AuthorizeNet", "README-AuthorizeNet"
      m.directory "app/views/#{file_name}"
      m.file "payment.erb", "app/views/#{file_name}/payment.erb"
      m.file "thank_you.erb", "app/views/#{file_name}/thank_you.erb"
      m.file "layout.erb", "app/views/layouts/authorize_net.erb"
      m.template "config.yml.erb", "config/authorize_net.yml"
      m.file "initializer.rb", "config/initializers/authorize_net.rb"
      m.template "controller.rb.erb", "app/controllers/#{file_name}_controller.rb"
      m.route :name => "#{singular_name}_thank_you", :path => "/#{plural_name}/thank_you", :controller => file_name, :action => 'thank_you', :conditions => "{:method => :get}"
      m.route :name => "#{singular_name}_payment", :path => "/#{plural_name}/payment", :controller => file_name, :action => 'payment', :conditions => "{:method => :get}"
      m.gem :name => 'authorize-net'
    end
  end
end
