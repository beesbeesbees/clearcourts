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

require 'test_helper'

class CitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
