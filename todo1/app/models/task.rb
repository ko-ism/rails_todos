class Task < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  validates :status, :inclusion => [true, false]
  validates :deadline, :presence => true
end
