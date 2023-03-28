require 'rails_helper'

RSpec.describe 'the Car creation' do
  it 'links to the update car page from the cars index' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    car_1 = Car.create!(make: "Tesla",
                        model: "Model S",
                        year: 2023,
                        miles: 50,
                        ev: true,
                        dealership_id: dealership.id)
    visit '/cars'
    click_link('Update Car')
    expect(current_path).to eq("/cars/#{car_1.id}/edit")
  end

  it 'can update a new car' do
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    car_1 = Car.create!(make: "Tesla",
                        model: "Model S",
                        year: 2023,
                        miles: 50,
                        ev: true,
                        dealership_id: dealership.id)
    visit '/cars'
    click_link('Update Car')
    fill_in('car[make]', with: 'Tesla')
    fill_in('car[model]', with: 'Model 3')
    fill_in('car[year]', with: 2023)
    fill_in('car[miles]', with: 50)
    choose('car_ev_true')
    fill_in('car[dealership_id]', with: dealership.id)
    click_on('Submit')
    expect(current_path).to eq("/cars/#{car_1.id}")
    expect(page).to have_content("Model 3")
  end
end