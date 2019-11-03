class Person < ApplicationRecord
  require 'csv'
  validates :first_name, :locations, :species, :gender, :affiliations, presence: true

  # has_many :locations
  has_many :affiliations
  has_many :locations, :foreign_key => "id", :class_name => "Location"


  def self.import
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    # loc = table.by_row[0]
    # puts table.count
    # puts table.by_row[0]
    # table.each do |0..table.count-1|
    #   puts row.by_row[]
    #
    # end
    size = table.count-1
    for i in 0..size do
      puts i
      # puts "OOOOOOOOOOO"
      if !table.by_row[i]["Affiliations"].nil? # Only add Person with Affiliations
        location = Location.find_by(name: table.by_row[i]["Location"].titlecase)
        affiliation = Affiliation.find_by(name: table.by_row[i]["Affiliations"])
        name = table.by_row[i]["Name"]
        split_name = name.split(" ", 2)
        # puts split_name[0].titlecase # First name
        Person.find_or_create_by!(
          first_name: split_name[0].titlecase,

          # puts split_name[1].titlecase # Second name
          last_name: !split_name[1].nil? ? split_name[1].titlecase : "",

          # puts table.by_row[i]["Location"].titlecase
          locations: location.id,

          # puts table.by_row[i]["Species"]
          species: table.by_row[i]["Species"],

          # puts table.by_row[i]["Gender"]
          gender: table.by_row[i]["Gender"],

          # puts table.by_row[i]["Affiliations"]
          affiliations: affiliation.id,

          # puts table.by_row[i]["Weapon"]
          weapon: !table.by_row[i]["Weapon"].nil? ? table.by_row[i]["Weapon"] : "",

          # puts table.by_row[i]["Vehicle"]
          vehicle: !table.by_row[i]["Vehicle"].nil? ? table.by_row[i]["Vehicle"] : "",
        )

      end
    end
  end

end
