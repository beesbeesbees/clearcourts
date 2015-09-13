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
#  phone_type     :string(255)
#

require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
