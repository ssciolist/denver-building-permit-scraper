require 'minitest/autorun'
require 'minitest/pride'
require './lib/scraper.rb'
require 'pry'

class ScraperTest < Minitest::Test
  def setup
    @scraper = Scraper.new
  end

  def test_it_exists
    assert_instance_of Scraper, @scraper
  end

  def test_it_returns_page
    page = @scraper.a_tags

    assert page.count > 74
  end

  def test_it_can_return_more_than_74_links
    assert @scraper.links.count > 74
  end

  def test_it_can_build_file_names_with_xls_extn
    last_file = @scraper.links.first
    file_name = @scraper.file_name_builder(last_file)

    assert file_name.match?(/20/)
    assert_equal ".xls", file_name[-4..-1]
  end
end
