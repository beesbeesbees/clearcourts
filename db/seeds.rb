require 'csv'

csv_file_path = 'db/seed_data/citations.csv'

CSV.foreach(csv_file_path, headers: true) do |row|
  citation = Citation.first_or_initialize(
    citation_number:          row['citation_number'],
    citation_date:            row['citation_date'],
    first_name:               row['first_name'],
    last_name:                row['last_name'],
    date_of_birth:            Date.strptime(row['date_of_birth'].split[0], "%m/%d/%Y"),
    defendant_address:        row['defendant_address'],
    defendant_city:           row['defendant_city'],
    defendant_state:          row['defendant_state'],
    drivers_license_number:   row['drivers_license_number'],
    court_date:               Date.strptime(row['court_date'].split[0], "%m/%d/%Y"),
  )
  citation.save
  break
end

,court_location,court_address

