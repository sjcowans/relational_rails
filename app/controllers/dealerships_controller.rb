class DealershipsController < ApplicationController
  def index
    if params[:sort].nil?
      @dealerships = Dealership.order(created_at: :desc)
    else 
      @dealerships = Dealership.order(cars_count: :desc)
    end
  end

  def create
    dealership = Dealership.new({
      name: params[:dealership][:name],
      zip: params[:dealership][:zip]
    })
    dealership.save
    redirect_to '/dealerships'
  end

  def show 
    @dealership = Dealership.find(params[:id])
  end

  def edit
    @dealership = Dealership.find(params[:id])
  end

  def update
    dealership = Dealership.find(params[:id])
    dealership.update({
      name: params[:dealership][:name],
      zip: params[:dealership][:zip]
      })
    dealership.save
    redirect_to "/dealerships/#{dealership.id}"
  end

  def destroy
    Dealership.destroy(params[:id])
    redirect_to '/dealerships'
  end
end