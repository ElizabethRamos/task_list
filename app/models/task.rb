class Task < ApplicationRecord
  validates :description, presence: true
  belongs_to :category
end
