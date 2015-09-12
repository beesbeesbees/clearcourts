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

require 'test_helper'

class ViolationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
