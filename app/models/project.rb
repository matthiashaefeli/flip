class Project < ApplicationRecord
  enum status: [:open, :in_progress, :canceled, :closed]
  belongs_to :project_type
  after_create :set_status
  has_many :conditions

  private

  def set_status
    self.status = 'open'
    self.save
  end
end
