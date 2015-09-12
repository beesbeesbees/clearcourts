# == Schema Information
#
# Table name: sessions
#
#  id             :integer          not null, primary key
#  expiration     :datetime
#  phone_number   :string(255)
#  email          :string(255)
#  contact_method :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  state          :string(255)
#

class Session < ActiveRecord::Base
  has_many :reminders
end
