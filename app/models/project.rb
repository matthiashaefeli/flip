class Project < ApplicationRecord
  enum status: [:open, :in_progress, :canceled, :closed]
  belongs_to :project_type
  has_many :conditions
  has_many :finances
  has_many :materials
  has_many :comments, :as => :commentable
end
