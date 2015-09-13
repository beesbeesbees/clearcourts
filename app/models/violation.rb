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
