require 'roo'
require 'roo-xls'
require 'pry'

class ExcelConverter
  def data_files
    Dir.glob('./data/*/*')
  end

  def csv_namer(file)
    file.scan(/\/data\/.{4}\/(.*).xls/).flatten.first
  end

  def file_root
    '/Users/meganarellano/turing/3module/projects/denver-building-permit-scraper/csv/'
  end

  def convert_to_csv
    data_files.each do |file|
      spreadsheet = Roo::Spreadsheet.open(file)
      csv = spreadsheet.sheet('Sheet1').to_csv
      file_name = file_root + csv_namer(file) + '.csv'
      CSV.open(file_name, "wb") do |file|
        CSV.parse(csv).each do |row|
          file << row
        end
      end
    end
  end

end

ec = ExcelConverter.new

ec.convert_to_csv
