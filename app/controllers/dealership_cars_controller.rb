class DealershipCarsController < ApplicationController
  def index
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @input = nil
  end

  def alphabetized
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @alphabetized_cars = @cars.order(:make, :model)
  end

  def filter_miles
    @value = 0
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @cars.select { |car| car.miles > @value }
  end
end
