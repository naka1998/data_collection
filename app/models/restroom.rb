class Restroom < ApplicationRecord
  belongs_to :pin
  validates :is_multipurpose, presence: true
end
