require "rake"
require "rspec/core/rake_task"

task default: :spec
desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ['--options', 'spec/spec.opts']
end

namespace "spec" do
  desc "Run the API spec"
  RSpec::Core::RakeTask.new('api') do |spec|
    spec.pattern = FileList['spec/api_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end

  desc "Run the Sample code Test Runner"
  RSpec::Core::RakeTask.new('testrunner') do |spec|
    spec.pattern = FileList['sample-code-ruby/spec/sample_code_spec.rb']
    spec.rspec_opts = ['--options', 'spec/spec.opts']
  end
end

desc "Builds the gem"
task :gem do
  `gem build authorizenet.gemspec`
end

desc "Builds the documentation"
task :doc do
  `rdoc -U -S --main=README.rdoc -A documented_accessor=RW README.rdoc lib/`
end

namespace "doc" do
  desc "Builds the documentation with graphical class hierarchy"
  task :graph do
    `rdoc -U -d -S --main=README.rdoc -A documented_accessor=RW README.rdoc lib/`
  end
end

desc "Builds the documentation (alias of :doc)"
task :rdoc do
  Rake::Task[:doc].execute
end

desc "Bundles the sample app."
task :samples do
  `. sample_app_version && zip -r anet_ruby_samples-$VERSION.zip sample_app -x '*/.*' -x '*/Icon' -x '*/__MACOSX'`
end

desc "Bundles the sample app and gem."
task :bundle do
  Rake::Task[:samples].execute
  Rake::Task[:gem].execute
end
