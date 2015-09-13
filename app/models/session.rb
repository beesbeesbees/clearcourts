# == Schema Information
#
# Table name: sessions
#
#  id              :integer          not null, primary key
#  phone_number    :string(255)
#  email           :string(255)
#  contact_method  :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  state           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  birth_day       :integer
#  birth_month     :integer
#  birth_year      :integer
#  phone_type      :string(255)
#  citation_number :string(255)
#

class Session < ActiveRecord::Base
  SMS_SESSION_TIMEOUT_SECONDS= 180
  WEB_SESSION_TIMEOUT_SECONDS= 360

  has_many :reminders

  create_with state: 'greeting_1'.freeze

  validates :state, inclusion: {in: %w[
    greeting_1 greeting_3 greeting_4 greeting_5 greeting_6 greeting_7
    citation_1 citation_2 citation_3 citation_4a citation_4b citation_5
    payment_1 payment_2a payment_2b payment_3a payment_3b payment_4a payment_4b payment_5 payment_6a payment_6b payment_7
    courts_1a courts_1b courts_2 courts_3 courts_4 courts_5
    restart_1 end_1
  ]}, unless:'web?'.freeze

  validates :state, inclusion: {in: [nil]}, if: 'web?'.freeze

  validates :phone_number, uniqueness: true, unless: 'web?'.freeze

  def web?
    phone_number.!
  end

  def web!
    update!(phone_number: nil, state: nil)
  end

  def next_action
    if state.to_s.empty?
      :greeting_1
    else
      state.to_s.to_sym
    end
  end

  def dob_string
    "#{birth_day}/#{birth_month}/#{birth_year} 00:00:00"
  end

  def dob
    dob_string.to_datetime
  end
end
