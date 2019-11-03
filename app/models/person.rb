class Person < ApplicationRecord
  require 'csv'
  validates :first_name, :locations, :species, :gender, :affiliations, presence: true

  belongs_to :affiliation, optional: true
  belongs_to :location, optional: true

  # set per_page globally
  WillPaginate.per_page = 10

  def self.import
    table = CSV.parse(File.read('data/csv_sheet1.csv'), headers: true)
    size = table.count-1
    for i in 0..size do
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

  def self.search(search)
    where("affiliations ILIKE ?", "%#{search}%")
  end

end
