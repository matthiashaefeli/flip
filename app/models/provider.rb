class Provider < ApplicationRecord
  enum status: [:active, :inactive]
  after_create :set_status

  private

  def set_status
    self.status = 'active'
    self.save
  end
end
