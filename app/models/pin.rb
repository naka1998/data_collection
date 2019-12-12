class Pin < ApplicationRecord
  belongs_to :station
  has_many :elevators
  has_many :restrooms
  has_many :slopes
  has_many :steps
  accepts_nested_attributes_for :elevators, allow_destroy: true
  accepts_nested_attributes_for :restrooms, allow_destroy: true
  accepts_nested_attributes_for :slopes, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true
  enum data_type:{
    elevator: 1,
    restroom: 2,
    slope: 3,
    step: 4
  }
end
