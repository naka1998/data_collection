class Step < ApplicationRecord
  belongs_to :pin
  validates :level, presence: true
end
