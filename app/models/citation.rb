class Citation < ActiveRecord::Base
  has_many :violations
end
