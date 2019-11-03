class Location < ApplicationRecord
  require 'csv'
  has_many :people

  def self.import
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    loc = table.by_col[1]
    loc.each do |row|
      self.find_or_create_by!(
        name: row.titlecase
      )
    end
  end

end


