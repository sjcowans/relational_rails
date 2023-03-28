require 'rails_helper'

RSpec.describe 'the dealership creation' do
  it 'links to the update dealership page from the dealerships index' do
    dealership_1 = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    visit '/dealerships'
    click_link('Update Dealership')
    expect(current_path).to eq("/dealerships/#{dealership_1.id}/edit")
  end

  it 'can update a new dealership' do
    dealership_1 = Dealership.create!(name: "Kia",
                                     zip: 79938,
                                     operational: true)
    visit "/dealerships"
    click_link('Update Dealership')
    fill_in('dealership[name]', with: 'Honda')
    fill_in('dealership[zip]', with: 79938)
    choose("dealership_operational_true")
    click_button('Submit')
    expect(current_path).to eq("/dealerships/#{dealership_1.id}")
    expect(page).to have_content("Honda")
    expect(page).to_not have_content("Kia")
    expect(page).to have_content('Cars')
    expect(page).to have_content('Home')
    expect(page).to have_content('Dealership Index')
    expect(page).to have_content('Car Index')
    end
end