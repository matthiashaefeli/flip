class Contractor < ApplicationRecord
  enum status: [:active, :inactive]
end
