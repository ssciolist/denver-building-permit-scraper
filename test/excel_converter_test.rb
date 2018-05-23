require 'minitest/autorun'
require 'minitest/pride'
require './lib/excel_converter.rb'

class ExcelConverterTest < Minitest::Test
  def setup
    @ec = ExcelConverter.new
  end

  def test_it_exists
    assert_instance_of ExcelConverter, @ec
  end

  def test_it_returns_at_least_63_files
    assert @ec.data_files.count > 62
  end
end
