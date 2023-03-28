class Dealership < ApplicationRecord
  has_many :cars, dependent: :destroy
  def count
    self.cars.count 
  end
end