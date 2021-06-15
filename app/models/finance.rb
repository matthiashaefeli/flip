class Finance < ApplicationRecord
  enum ftype: [:in, :out]
  belongs_to :project
end
