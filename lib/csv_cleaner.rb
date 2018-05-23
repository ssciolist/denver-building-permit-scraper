require 'pry'
require 'CSV'
class CsvCleaner

  def strip_empty_rows(file_name)
    CSV.foreach(file_name) do |row|
      binding.pry

    end
  end
end
