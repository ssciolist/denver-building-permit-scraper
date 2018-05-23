require 'mechanize'
require 'open-uri'
require 'pry'

class Scraper

  def page
    agent = Mechanize.new
    agent.get("https://www.denvergov.org/content/denvergov/en/denver-development-services/help-me-find-/building-permits.html")
  end

  def a_tags
    page.css('li a[adhocenable="false"]')
  end


  def links
    a_tags.map do |item|
      if item['href'].include?(' ')
        new_href = item['href'].gsub!(' ', '%20')
        "https://www.denvergov.org" + new_href
      else
        "https://www.denvergov.org" + item['href']
      end
    end
  end

  def file_name_builder(link)
    link.scan(/(20.*)/).flatten.fetch(0)
  end

  def file_root
    '/Users/meganarellano/turing/3module/projects/denver-building-permit-scraper/data/'
  end

  def take_files
    links.each do |link|
      file_name = file_root + file_name_builder(link)
      File.open(file_name, 'wb') do |file|
        file << open(link).read
      end
    end
  end
end
