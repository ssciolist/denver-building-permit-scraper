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

  def test_it_can_strip_rows
    @cleaner.strip_empty_rows('/Users/meganarellano/turing/3module/projects/denver-building-permit-scraper/csv/April-2015_test.csv')
  end

end
