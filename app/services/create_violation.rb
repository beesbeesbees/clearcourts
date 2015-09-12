class CreateViolation
  def self.call(row)
    row = row.to_h
    citation = Citation.find_by(citation_number: row['citation_number'])

    violation = Violation.where(
      violation_number: row['violation_number']
    ).first_or_create

    fine_amount = row.fetch('fine_amount')
    fine_amount ||= "$0.00"

    court_cost = row.fetch('court_cost')
    court_cost ||= '$0.00'

    begin
      status_date = Date.strptime(row['status_date'].split[0], "%m/%d/%Y")
    rescue NoMethodError
      status_date = ''
    end

    violation.update(
      violation_description:               row.fetch('violation_description', ''),
      warrant_status:                      row.fetch('warrant_status', ''),
      warrant_number:                      row.fetch('warrant_number', ''),
      status:                              row.fetch('status', ''),
      status_date:                         status_date,
      fine_amount:                         fine_amount.tr('$','').tr('.', '').to_i,
      court_cost:                          court_cost.tr('$','').tr('.', '').to_i,
      citation_id:                         citation.id
    )
  end
end
