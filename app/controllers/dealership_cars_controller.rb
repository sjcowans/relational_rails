class DealershipCarsController < ApplicationController
  def index
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = if params[:miles_filter].nil?
              @dealership.cars
            else
              @dealership.cars.filter_miles(params[:miles_filter])
            end
  end

  def alphabetized
    @dealerships = Dealership.all
    @dealership = Dealership.find(params[:id])
    @cars = if params[:miles_filter].nil?
              @dealership.cars
            else
              @dealership.cars.filter_miles(params[:miles_filter])
            end
    @alphabetized_cars = @cars.order(:make, :model)
  end
end
