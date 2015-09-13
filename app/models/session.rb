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
#  first_name     :string(255)
#  last_name      :string(255)
#  birth_day      :integer
#  birth_month    :integer
#  birth_year     :integer
#

class Session < ActiveRecord::Base
  SMS_SESSION_TIMEOUT_SECONDS= 120

  has_many :reminders

  create_with state: 'greeting_1'.freeze

  validates :state, inclusion: {in: %w[
    greeting_1 greeting_3 greeting_4 greeting_5 greeting_6 greeting_7
  ]}, unless: 'phone_number.!'.freeze

  validates :state, inclusion: {in: [nil]}, if: 'phone_number.!.!'.freeze

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
end
