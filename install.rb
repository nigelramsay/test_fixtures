puts IO.read(File.join(File.dirname(__FILE__), 'README'))
FileUtils.copy(Dir[File.dirname(__FILE__) + 'test/fixtures_test.rb', RAILS_ROOT + "/test/units/fixtures_test.rb", :verbose => true)