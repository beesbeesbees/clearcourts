class CreateCourt
  def self.call(court_address, court_location)
    court = Court.where(
      court_address:  court_address,
      court_location: court_location
    ).first_or_create
    court
  end
end
