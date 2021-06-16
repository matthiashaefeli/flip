class Provider < ApplicationRecord
  enum status: [:active, :inactive]
end
