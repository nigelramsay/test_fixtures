require 'test_helper'

class FixturesTest < ActiveSupport::TestCase
  def test_fixtures
    assert_not_equal(0, all_fixture_tables.size, "Unable to find any fixtures in #{fixture_files_path}")
    
    all_fixture_tables.each do |table_name|
      begin
        klass = table_name.to_s.classify.constantize
        klass.send(:find, :all).each do |object|
          assert_valid(object)
        end
      rescue NameError
        # Probably a has and belongs to many mapping table with no ActiveRecord model
      end
    end
  end
  
  private
  
  def fixture_files_path
    File.join(File.dirname(__FILE__) + "/../fixtures", "*.yml")
  end

  def all_fixture_tables
    Dir[fixture_files_path].map { |file| File.basename(file[/^(.+)\.[^.]+?$/, 1]) }    
  end  
end

module ActionController
  module Assertions
    module ModelAssertions
      def assert_valid(record)
        clean_backtrace do
          assert record.valid?, "#{record.class}[#{record.id||record.object_id}] is not valid:\n  #{record.errors.full_messages.join("\n  ")}" 
        end
      end
    end
  end
end
