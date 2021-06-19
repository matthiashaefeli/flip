class Contractor < ApplicationRecord
  enum status: [:active, :inactive]
  has_many :works
end
