class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
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