class Condition < ApplicationRecord
  enum status: [:open, :in_progress, :finished]
  belongs_to :project
  has_many :works
end
