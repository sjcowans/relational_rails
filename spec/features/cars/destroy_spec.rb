require 'rails_helper'

RSpec.describe 'destroying a car' do
  it 'can delete the car from the index page' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    car_3 = Car.create!(make: "Tesla",
                        model: "Model S",
                        year: 2023,
                        miles: 150,
                        ev: true,
                        dealership_id: dealership.id)

    visit '/cars'

    click_on 'Delete Car'

    expect(current_path).to eq('/cars')
    expect(page).to_not have_content('Tesla')
  end

  it 'can delete the car from the show page' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    car_3 = Car.create!(make: "Tesla",
                        model: "Model S",
                        year: 2023,
                        miles: 150,
                        ev: true,
                        dealership_id: dealership.id)

    visit "/cars/#{car_3.id}"

    click_on 'Delete Car'

    expect(current_path).to eq('/cars')
    expect(page).to_not have_content('Tesla')
  end
end
