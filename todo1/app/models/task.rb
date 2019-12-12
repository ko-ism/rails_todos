class Task < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true
  validates :status, :inclusion => [true, false]
  validates :deadline, :presence => true
  belongs_to :user

  scope :recent, lambda{ where("deadline <= ?", 3.days.since)}
  scope :closed, lambda{ where(:status => true)}
end
