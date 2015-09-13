# == Schema Information
#
# Table name: sessions
#
#  id             :integer          not null, primary key
#  phone_number   :string(255)
#  email          :string(255)
#  contact_method :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  state          :string(255)
#

class Session < ActiveRecord::Base
  SMS_SESSION_TIMEOUT_SECONDS= 20

  has_many :reminders

  create_with state: 'begun'.freeze

  validates :state, inclusion: { in: %w[
    begun foo bar
  ] }

  def web?
    phone_number.!
  end

  def web!
    update!(phone_number: nil)
  end
end
