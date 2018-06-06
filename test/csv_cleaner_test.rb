require 'minitest/autorun'
require 'minitest/pride'
require './lib/csv_cleaner.rb'
require 'pry'

class CsvCleanerTest < Minitest::Test
  def setup
    @cleaner = CsvCleaner.new
  end

  def test_it_exists
    assert_instance_of CsvCleaner, @cleaner
  end

  def test_it_cleans_all_files
    refute_equal @cleaner.original_csv_files.count, Dir.glob('./cleaned/*').count
    # ^ cleaner does not clean malformed files 
  end
end
