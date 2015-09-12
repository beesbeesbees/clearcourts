# == Schema Information
#
# Table name: courts
#
#  id             :integer          not null, primary key
#  court_location :string(255)
#  court_address  :string(255)
#  dress_code_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Court < ActiveRecord::Base
  has_many :citations
  has_many :violations, through: :citations
end
