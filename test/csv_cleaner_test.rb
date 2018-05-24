require 'minitest/autorun'
require 'minitest/pride'
require './lib/csv_cleaner.rb'
require 'pry'

class ExcelConverterTest < Minitest::Test
  def setup
    @cleaner = CsvCleaner.new
  end

  def test_it_exists
    assert_instance_of CsvCleaner, @cleaner
  end

  def test_it_cleans_all_files
    assert_equal @cleaner.original_csv_files.count, Dir.glob('./cleaned/*').count
  end

  # def test_it_can_find_stat_code
  #   old = '/Users/meganarellano/turing/3module/projects/denver-building-permit-scraper/csv/April-2015_test.csv'
  #   newer = '/Users/meganarellano/turing/3module/projects/denver-building-permit-scraper/csv/test_test.csv'
  #   @cleaner.output_clean_csv(newer, old)
  # end

end
