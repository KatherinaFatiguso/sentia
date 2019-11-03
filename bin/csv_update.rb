require_relative 'locations_controller'
require 'csv'
csv_file = ARGV.first
puts csv_file

CSV.foreach(csv_file) do |row|
  puts row[0]
  # Location.find_or_create_by!(
  #   name: row[1]
  # )
end

# loc = ::Location.new
loc = Location.new
puts loc
