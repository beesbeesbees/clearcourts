class Court < ActiveRecord::Base
  has_many :citations
  has_many :violations, through: :citations
  has_many :users
end
