class Person < ApplicationRecord
  require 'csv'
  # validates :first_name :locations :species :gender :affiliations presence: true

  # has_many :locations
  # has_many :affiliations

  def self.import
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    # loc = table.by_row[0]
    # puts table.count
    # puts table.by_row[0]
    # table.each do |0..table.count-1|
    #   puts row.by_row[]
    #
    # end
    for i in 0..table.count-1 do
      # puts i
      # puts table.by_row[i]["Name"].split(",", 2)
      name = table.by_row[i]["Name"]
      split_name = name.split(" ", 2)
      # puts split_name[0].titlecase # First name
      # if !split_name[1].nil?
      #   puts split_name[1].titlecase # Second name
      # end
      # puts table.by_row[i]["Location"].titlecase
      # puts table.by_row[i]["Species"]
      # puts table.by_row[i]["Gender"]
      # puts table.by_row[i]["Affiliations"]
      # if table.by_row[i]["Affiliations"].nil?
      #   puts 'buzzzzzz'
      # end
      puts table.by_row[i]["Weapon"]
      # puts table.by_row[i]["Vehicle"]
    end
  end

end
