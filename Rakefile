require "rake"
require "spec/rake/spectask"

task :default => :spec
desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end

namespace "spec" do
  desc "Run the CIM spec"
  Spec::Rake::SpecTask.new('cim') do |t|
    t.spec_files = FileList['spec/cim_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the ARB spec"
  Spec::Rake::SpecTask.new('arb') do |t|
    t.spec_files = FileList['spec/arb_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the AIM spec"
  Spec::Rake::SpecTask.new('aim') do |t|
    t.spec_files = FileList['spec/aim_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the SIM spec"
  Spec::Rake::SpecTask.new('sim') do |t|
    t.spec_files = FileList['spec/sim_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
  end
  
  desc "Run the Reporting spec"
  Spec::Rake::SpecTask.new('reporting') do |t|
    t.spec_files = FileList['spec/reporting_spec.rb']
    t.spec_opts = ['--options', 'spec/spec.opts']
  end
end

desc "Builds the gem"
task :gem do
  %x"gem build authorize-net.gemspec"
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
