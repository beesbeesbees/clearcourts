# == Schema Information
#
# Table name: reminders
#
#  id         :integer          not null, primary key
#  send_date  :datetime
#  session_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
