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
  end

  def test_it_can_return_more_than_74_links
    assert @scraper.links.count > 74
  end
end
