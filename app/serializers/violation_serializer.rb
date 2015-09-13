class ViolationSerializer < ActiveModel::Serializer
  attributes :id, :violation_number, :citation_id, :violation_description, :warrant_status, :warrant_number, :status, :status_date,
    :fine_amount, :court_cost

  #belongs_to :citation
end
