class Car < ApplicationRecord
  belongs_to :dealership, counter_cache: true

  def self.filter_miles(miles)
    Car.where("miles > #{miles}")
  end
end