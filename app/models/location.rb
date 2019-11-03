class Location < ApplicationRecord
  require 'csv'
  # belongs_to :person

  def self.import
    csv_file = File.read('data/csv_sheet1.csv')
    # puts csv_file
    # CSV.read("/data/csv_update.rb")

    # CSV.foreach(csv_file, headers: true) do |row|
    #   puts row.inspect
    #   # Location.find_or_create_by!(
    #   #   name: row[1]
    #   # )
    # end
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    # puts table.by_col[1]
    loc = table.by_col[1]
    loc.each do |row|
      # puts row.titlecase
      self.find_or_create_by!(
        name: row.titlecase
      )
    end
  end

end


