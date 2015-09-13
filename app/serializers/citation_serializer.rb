class CitationSerializer < ActiveModel::Serializer
  attributes :id, :citation_number, :citation_date, :first_name, :last_name, :date_of_birth, :defendant_address, :defendant_city,
    :defendant_state, :drivers_license_number, :court_id, :court_date

  has_many :violations
end
