require 'csv'
# == Schema Information
#
# Table name: citations
#
#  id                     :integer          not null, primary key
#  citation_number        :integer
#  citation_date          :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  date_of_birth          :datetime
#  defendant_address      :string(255)
#  defendant_city         :string(255)
#  defendant_state        :string(255)
#  drivers_license_number :string(255)
#  court_id               :integer
#  court_date             :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Citation < ActiveRecord::Base
  has_many :violations
  belongs_to :court

  accepts_nested_attributes_for :violations


  def formatted_date(date)
    if date
      date.strftime("%B %e, %Y")
    else
      "NONE LISTED"
    end
  end

  # def has_warrant? TOO TIRED DON'T KNOW WTF
  #   violations.each do |v|
  #     v.warrant_status
  #   end
  # 

  def has_warrant?
    if violations.where(warrant_status: true).count == 0
      false
    else
      true
    end
  end

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
