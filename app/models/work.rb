class Work < ApplicationRecord
  enum status: [:open, :in_progress, :canceled, :closed]
  belongs_to :contractor
  belongs_to :condition
end
