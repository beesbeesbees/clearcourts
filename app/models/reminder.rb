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

class Reminder < ActiveRecord::Base
  belongs_to :session
end
