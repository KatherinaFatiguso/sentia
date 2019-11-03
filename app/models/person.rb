class Person < ApplicationRecord
  require 'csv'
  validates :first_name, :locations, :species, :gender, :affiliations, presence: true

  # has_many :locations
  belongs_to :affiliation, optional: true
  belongs_to :location, optional: true


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
      # puts "OOOOOOOOOOO"
      if !table.by_row[i]["Affiliations"].nil? # Only add Person with Affiliation
        location = Location.find_by(name: table.by_row[i]["Location"].titlecase)
        affiliation = Affiliation.find_by(name: table.by_row[i]["Affiliations"])
        name = table.by_row[i]["Name"]
        split_name = name.split(" ", 2)

        Person.find_or_create_by!(
          first_name: split_name[0].titlecase,
          last_name: !split_name[1].nil? ? split_name[1].titlecase : "",
          locations: location.name,
          species: table.by_row[i]["Species"],
          gender: table.by_row[i]["Gender"],
          affiliations: affiliation.name,
          weapon: !table.by_row[i]["Weapon"].nil? ? table.by_row[i]["Weapon"] : "",
          vehicle: !table.by_row[i]["Vehicle"].nil? ? table.by_row[i]["Vehicle"] : "",
        )
      end
    end
  end

end
