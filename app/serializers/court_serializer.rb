class CourtSerializer < ActiveModel::Serializer
  attributes :id, :court_address, :court_location

  #has_many :citations
  #has_many :violations, through: :citations
end
