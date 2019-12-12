class Elevator < ApplicationRecord
  belongs_to :pin
  validates :from, presence: true
  validates :to, presence: true
end
