class Location < ApplicationRecord
  require 'csv'
  belongs_to :person

  def self.import
    csv_file = File.read('data/csv_sheet1.csv')
    # puts csv_file
    # CSV.read("/data/csv_update.rb")

    # CSV.foreach(csv_file, headers: true) do |row|
    #   puts row[0][0]
      # Location.find_or_create_by!(
      #   name: row[1]
      # )
    # end
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    puts table[0]
  end

end


