# == Schema Information
#
# Table name: violations
#
#  id                    :integer          not null, primary key
#  violation_number      :string(255)
#  citation_id           :string(255)
#  violation_description :string(255)
#  warrant_status        :boolean
#  status                :string(255)
#  warrant_number        :string(255)
#  status_date           :datetime
#  fine_amount           :integer
#  court_cost            :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Violation < ActiveRecord::Base
  belongs_to :citation


  def self.import(file)
    count = 0

    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      violation = CreateViolation.call(row)
      count += 1
    end
    count
  end
end
