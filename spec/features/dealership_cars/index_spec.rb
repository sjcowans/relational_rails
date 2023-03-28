require 'rails_helper'

RSpec.describe "dealership cars index page", type: :feature do
  it "can see all cars for the dealership" do
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
  visit "/dealerships/#{dealership.id}/cars"

  expect(page).to have_content(car_1.make)
  expect(page).to have_content(car_1.make)
  expect(page).to have_content(car_1.model)
  expect(page).to have_content(car_1.year)
  expect(page).to have_content(car_1.miles)
  expect(page).to have_content(car_1.ev)
  expect(page).to have_content(car_1.created_at)
  expect(page).to have_content(car_1.updated_at)
  expect(page).to have_content(car_4.make)
  expect(page).to have_content(car_4.model)
  expect(page).to have_content(car_4.year)
  expect(page).to have_content(car_4.miles)
  expect(page).to have_content(car_4.ev)
  expect(page).to have_content(car_4.created_at)
  expect(page).to have_content(car_4.updated_at)
  expect(page).to have_content("Dealership Index")
  expect(page).to have_content("Car Index")
  expect(page).to have_content("Alphabetical Order")
  expect(page).to have_content("Home")
  expect(page).to have_content("Cars above miles:")
  end

  it 'can filter by miles' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    car_1 = Car.create!(make: "Ford",
                        model: "Focus",
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
    car_5 = Car.create!(make: "Dodge",
                        model: "Charger",
                        year: 2023,
                        miles: 500,
                        ev: false,
                        dealership_id: dealership.id)
  visit "/dealerships/#{dealership.id}/cars"
  fill_in('miles_filter', with: 40000)
  click_on('Submit')

  expect(page).to have_content(car_1.make)
  expect(page).to have_no_content(car_2.make)
  expect(page).to have_no_content(car_3.make)
  expect(page).to have_no_content(car_4.make)
  expect(page).to have_no_content(car_5.make)
  end

  it 'can sort dealerships by cars' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    dealership2 = Dealership.create!(name: "Ford",
                                    zip: 79938,
                                    operational: true)
    car_1 = Car.create!(make: "Ford",
                        model: "Focus",
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
                        dealership_id: dealership2.id)
    car_4 = Car.create!(make: "Tesla",
                        model: "Model 3",
                        year: 2023,
                        miles: 500,
                        ev: true,
                        dealership_id: dealership2.id)
    car_5 = Car.create!(make: "Dodge",
                        model: "Charger",
                        year: 2023,
                        miles: 500,
                        ev: false,
                        dealership_id: dealership2.id)
  visit "/dealerships"

  click_on('Sort By Cars')

  expect(page).to have_content('Total Cars: 3')
  expect(page).to have_content('Total Cars: 2')
  expect(page).to have_content(dealership.count)
  expect(page).to have_content(dealership2.count)
  expect(dealership2.name).to appear_before(dealership.name)
  end
end
                        
    