class Task < ApplicationRecord
  belongs_to :user
  
  validates :taskname, presence: true, length: { maximum: 30 }
  validates :detailed, presence: true, length: { maximum: 150 }
end
