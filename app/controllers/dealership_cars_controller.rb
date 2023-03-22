class DealershipCarsController < ApplicationController
  def index
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end

  def alphabetized
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
    @alphabetized_cars = @cars.order(:make, :model)
  end
end
