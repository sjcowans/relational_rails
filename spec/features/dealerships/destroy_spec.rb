require 'rails_helper'

RSpec.describe 'destroying a dealership' do
  it 'can delete the dealership from the show page' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    visit "/dealerships/#{dealership.id}"

    click_on 'Delete Dealership'

    expect(current_path).to eq('/dealerships')
    expect(page).to_not have_content('Kia')
  end

  it 'deletes cars with dealership' do
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
    visit "/dealerships/#{dealership.id}"

    click_on 'Delete Dealership'

    expect(current_path).to eq('/dealerships')
    expect(page).to_not have_content('Kia')

    visit '/cars'

    expect(page).to_not have_content('Tesla')
  end

  it 'can delete from the index page' do
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
    visit "/dealerships"

    click_on 'Delete Dealership'

    expect(current_path).to eq('/dealerships')
    expect(page).to_not have_content('Kia')

    visit '/cars'

    expect(page).to_not have_content('Tesla')
  end
end
