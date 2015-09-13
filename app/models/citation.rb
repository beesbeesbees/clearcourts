class Citation < ActiveRecord::Base
  has_many :violations
  belongs_to :court

  accepts_nested_attributes_for :violations
end
