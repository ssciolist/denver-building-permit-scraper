require 'pry'
require 'CSV'
class CsvCleaner

  def strip_empty_rows(file_name)
    CSV.foreach(file_name) do |row|
      if row.first.is_a?(String) && row.first.include?("Stat Code:")
        @stat_code = row.first.scan(/Stat Code: (.*)/).flatten.first
      elsif row.first.is_a?(String) && row.first.match?(/\d{4}-\d{2}-\d{2}/)
      binding.pry

      end
    end
  end
end
