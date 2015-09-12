class Citation < ActiveRecord::Base
  has_many :violations
  belongs_to :court
end
