class Pin < ApplicationRecord
  belongs_to :station
  has_one :elevator
  has_one :restroom
  has_one :slope
  has_one :step
  
  accepts_nested_attributes_for :elevator, allow_destroy: true
  accepts_nested_attributes_for :restroom, allow_destroy: true
  accepts_nested_attributes_for :slope, allow_destroy: true
  accepts_nested_attributes_for :step, allow_destroy: true
  
  enum data_type:{
    elevator: 1,
    restroom: 2,
    slope: 3,
    step: 4
  }
end
