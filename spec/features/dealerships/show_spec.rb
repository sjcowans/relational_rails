require 'rails_helper'

RSpec.describe 'the dealerships show page' do
  it 'displays the dealership title' do
    dealership_1 = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    dealership_2 = Dealership.create!(name: "Jeep",
                                    zip: 79938,
                                    operational: true)
    dealership_3 = Dealership.create!(name: "Chevy",
                                    zip: 79938,
                                    operational: true)
    car_1 = Car.create!(make: "Kia",
                        model: "K5",
                        year: 2015,
                        miles: 50000,
                        ev: false,
                        dealership_id: dealership_3.id)
    car_2 = Car.create!(make: "Kia",
                        model: "K5 GT",
                        year: 2023,
                        miles: 50,
                        ev: false,
                        dealership_id: dealership_3.id)
    car_3 = Car.create!(make: "Tesla",
                        model: "Model S",
                        year: 2023,
                        miles: 150,
                        ev: true,
                        dealership_id: dealership_3.id)
    car_4 = Car.create!(make: "Tesla",
                        model: "Model 3",
                        year: 2023,
                        miles: 500,
                        ev: true,
                        dealership_id: dealership_3.id)

    visit "/dealerships/#{dealership_3.id}"

    expect(page).to have_content(dealership_3.name)
    expect(page).to have_content(dealership_3.zip)
    expect(page).to have_content(dealership_3.operational)
    expect(page).to_not have_content(dealership_2.name)
    expect(page).to have_content("Update Dealership")
    expect(page).to have_content("Dealership Index")
    expect(page).to have_content("Dealership Index")
    expect(page).to have_content("Home")
    expect(page).to have_content('Cars')
    expect(page).to have_content('cars: 4')
    expect(dealership_3.count).to eq(4)
  end
end
