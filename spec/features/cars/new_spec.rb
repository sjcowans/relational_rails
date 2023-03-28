require 'rails_helper'

RSpec.describe 'the Car creation' do
  it 'links to the new page from the cars index' do
    visit '/cars'

    click_link('New Car')
    expect(current_path).to eq('/cars/new')
  end

  it 'can create a new car' do
    visit '/cars/new'
    dealership = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    fill_in('car[make]', with: 'Tesla')
    fill_in('car[model]', with: 'Model S')
    fill_in('car[year]', with: 2023)
    fill_in('car[miles]', with: 12)
    choose('car_ev_true')
    fill_in('car[dealership_id]', with: dealership.id)
    click_button('Submit')

    expect(current_path).to eq("/cars")
    expect(page).to have_content("Tesla")
  end
end