class Condition < ApplicationRecord
  enum status: [:open, :in_progress, :finished]
  belongs_to :project
  after_create :set_status

  private

  def set_status
    self.status = 'open'
    self.save
  end
end
