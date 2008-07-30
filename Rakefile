require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: generate docs.'
task :default => :rdoc

desc 'Generate documentation for the test_fixtures plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'TestFixtures'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
