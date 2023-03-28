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

  it 'can alphabetize' do
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
    car_5 = Car.create!(make: "Dodge",
                        model: "Charger",
                        year: 2023,
                        miles: 500,
                        ev: false,
                        dealership_id: dealership.id)
  visit "/dealerships/#{dealership.id}/cars"

  expect(dealership.cars).to eq([car_1,car_2,car_3,car_4,car_5])
  expect(car_1.make).to appear_before(car_5.make)

  click_on('Alphabetical Order')

  expect(car_5.make).to appear_before(car_1.make)
  end

  it 'can filter by miles in alphabetize' do
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
  click_on('Alphabetical Order')
  fill_in('miles_filter', with: 40000)
  click_on('Submit')

  expect(page).to have_content(car_1.make)
  expect(page).to have_no_content(car_2.make)
  expect(page).to have_no_content(car_3.make)
  expect(page).to have_no_content(car_4.make)
  expect(page).to have_no_content(car_5.make)
  end
end