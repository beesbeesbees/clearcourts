class CreateCitation

  def self.call(row, court)
    citation = Citation.where(
      citation_number:          row.fetch('citation_number', '')
    ).first_or_create

    citation.update(
      first_name:               row.fetch('first_name', ''),
      last_name:                row.fetch('last_name', ''),
      defendant_address:        row.fetch('defendant_address', ''),
      defendant_city:           row.fetch('defendant_city', ''),
      defendant_state:          row.fetch('defendant_state', ''),
      drivers_license_number:   row.fetch('drivers_license_number', ''),
      court_id:                 court.id
    )

    begin
      citation.date_of_birth = Date.strptime(row['date_of_birth'].split[0], "%m/%d/%Y")
    rescue NoMethodError
    end

    begin
      citation.court_date    = Date.strptime(row['court_date'].split[0], "%m/%d/%Y")
    rescue NoMethodError
      #puts "Error parsing court date of row #{row['id']}, column contents: #{row['court_date']}"
    end

    begin
      citation.citation_date = Date.strptime(row['citation_date'].split[0], "%m/%d/%Y")
    rescue
      #puts "Error parsing citation date of row #{row['id']}, column contents: #{row['citation_date']}"
    end
    citation.save
    citation
  end
end
