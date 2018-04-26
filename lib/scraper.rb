require 'mechanize'
require 'open-uri'

agent = Mechanize.new
page = agent.get("https://www.denvergov.org/content/denvergov/en/denver-development-services/help-me-find-/building-permits.html")

a_tags = page.css('li a[adhocenable="false"]')

links = a_tags.map do |item|
  "https://www.denvergov.org" + item['href']
end

puts links

File.open('any_name_here.xls', 'wb') do |file|
 file << open('http://www.example.com/xls_file.xls').read
end
