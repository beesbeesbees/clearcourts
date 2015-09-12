require 'csv'

puts "Starting..."

csv_file_path = 'db/seed_data/citations.csv'

count = 0

CSV.foreach(csv_file_path, headers: true) do |row|
  court = CreateCourt.call(
    row['court_address'],
    row['court_location']
  )

  citation = CreateCitation.call(row, court)
  count += 1
end

puts "Imported #{count} citation records"


csv_file_path = 'db/seed_data/violations.csv'

count = 0

CSV.foreach(csv_file_path, headers: true) do |row|
  violation = CreateViolation.call(row)

  count += 1
end

puts "Imported #{count} violation records"
