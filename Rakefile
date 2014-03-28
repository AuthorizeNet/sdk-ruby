require "rake"
require "rspec/core/rake_task"

task :default => :spec
desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ['--options', 'spec/spec.opts']
end

namespace "spec" do
  desc "Run the CIM spec"
  RSpec::Core::RakeTask.new('cim') do |spec|
    spec.pattern  = FileList['spec/cim_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the ARB spec"
  RSpec::Core::RakeTask.new('arb') do |spec|
    spec.pattern = FileList['spec/arb_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the AIM spec"
  RSpec::Core::RakeTask.new('aim') do |spec|
    spec.pattern = FileList['spec/aim_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the SIM spec"
  RSpec::Core::RakeTask.new('sim') do |spec|
    spec.pattern = FileList['spec/sim_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the Reporting spec"
  RSpec::Core::RakeTask.new('reporting') do |spec|
    spec.pattern = FileList['spec/reporting_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end
end

desc "Builds the gem"
task :gem do
  %x"gem build authorizenet.gemspec"
end

desc "Builds the documentation"
task :doc do
  %x"rdoc -U -S --main=README.rdoc -A documented_accessor=RW README.rdoc lib/"
end

namespace "doc" do
  desc "Builds the documentation with graphical class hierarchy"
  task :graph do
    %x"rdoc -U -d -S --main=README.rdoc -A documented_accessor=RW README.rdoc lib/"
  end
end

desc "Builds the documentation (alias of :doc)"
task :rdoc do
  Rake::Task[:doc].execute
end

desc "Bundles the sample app."
task :samples do
  %x". sample_app_version && zip -r anet_ruby_samples-$VERSION.zip sample_app -x '*/.*' -x '*/Icon' -x '*/__MACOSX'"
end

desc "Bundles the sample app and gem."
task :bundle do
  Rake::Task[:samples].execute
  Rake::Task[:gem].execute
end
