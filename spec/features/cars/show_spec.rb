require 'rails_helper'

RSpec.describe 'the cars show page' do
  it 'displays the car title' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    car_1 = Car.create!(make: "Kia",
                        model: "K5",
                        year: 2015,
                        miles: 50000,
                        ev: false,
                        dealership_id: dealership.id)
    car_2 = Car.create!(make: "Kia",
                        model: "K5 GT",
                        year: 2023,
                        miles: 50,
                        ev: false,
                        dealership_id: dealership.id)
    car_3 = Car.create!(make: "Tesla",
                        model: "Model S",
                        year: 2023,
                        miles: 150,
                        ev: true,
                        dealership_id: dealership.id)
    car_4 = Car.create!(make: "Tesla",
                        model: "Model 3",
                        year: 2023,
                        miles: 500,
                        ev: true,
                        dealership_id: dealership.id)

    visit "/cars/#{car_3.id}"

    expect(page).to have_content(car_3.make)
    expect(page).to have_content(car_3.model)
    expect(page).to have_content(car_3.year)
    expect(page).to have_content(car_3.miles)
    expect(page).to have_content(car_3.ev)
    expect(page).to have_content(car_3.created_at)
    expect(page).to have_content(car_3.updated_at)
    expect(page).to_not have_content(car_2.make)
    expect(page).to have_content("Update Car")
    expect(page).to have_content("Dealership Index")
    expect(page).to have_content("Car Index")
    expect(page).to have_content("Home")
  end
end
