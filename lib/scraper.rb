require 'mechanize'
require 'open-uri'


agent = Mechanize.new
page = agent.get("https://www.denvergov.org/content/denvergov/en/denver-development-services/help-me-find-/building-permits.html")


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


links.each do |link|
  file_name = file_root + file_name_builder(link)
  File.open(file_name, 'wb') do |file|
    file << open(link).read
  end
end
