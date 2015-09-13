require 'csv'

class Citation < ActiveRecord::Base
  has_many :violations
  belongs_to :court

  accepts_nested_attributes_for :violations


  def self.import(file)
    count = 0

    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      court = CreateCourt.call(
        row['court_address'],
        row['court_location']
      )

      citation = CreateCitation.call(row, court)
      count += 1
    end
    count
  end
end
