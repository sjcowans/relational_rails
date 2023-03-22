class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
  end

  def create
    car = Car.new({
      make: params[:car][:make],
      model: params[:car][:model],
      year: params[:car][:year],
      miles: params[:car][:miles],
      ev: params[:car][:ev],
      created_at: params[:car][:created_at],
      updated_at: params[:car][:updated_at],
      dealership_id: params[:car][:dealership_id]
    })
    car.save
    redirect_to '/cars'
  end

  def show 
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update({
      make: params[:car][:make],
      model: params[:car][:model],
      year: params[:car][:year],
      miles: params[:car][:miles],
      ev: params[:car][:ev],
      created_at: params[:car][:created_at],
      updated_at: params[:car][:updated_at],
      dealership_id: params[:car][:dealership_id]
      })
    car.save
    redirect_to "/cars/#{car.id}"
  end

  def destroy
    Car.destroy(params[:id])
    redirect_to '/cars'
  end

  def showmethecars
    redirect_to '/cars'
  end
end