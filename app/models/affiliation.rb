class Affiliation < ApplicationRecord
  require 'csv'
  has_many :people
  def self.import
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    loc = table.by_col[4]
    loc.each do |row|
      if !row.nil?
        self.find_or_create_by!(
          name: row
        )
      end
    end
  end
end
