require 'csv'
require 'models/location'
csv_file = ARGV.first
puts csv_file

CSV.foreach(csv_file, headers: true) do |row|
  puts row[0]
  Location.find_or_create_by!(
    name: row[1]
  )
end

