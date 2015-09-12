class Session < ActiveRecord::Base
  has_many :reminders
end
