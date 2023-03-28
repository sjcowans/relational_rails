require 'rails_helper'

RSpec.describe 'the dealership creation' do
  it 'links to the new page from the dealerships index' do
    visit '/dealerships'

    click_link('New Dealership')
    expect(current_path).to eq('/dealerships/new')
  end

  it 'can create a new dealership' do
    visit '/dealerships/new'
    fill_in('dealership[name]', with: 'Kia')
    fill_in('dealership[zip]', with: 79938)
    choose("dealership_operational_true")
    click_button('Submit')

    expect(current_path).to eq("/dealerships")
    expect(page).to have_content("Kia")
    expect(page).to have_content('New Dealership')
    expect(page).to have_content('Home')
    expect(page).to have_content('Dealership Index')
    expect(page).to have_content('Car Index')
    expect(page).to have_content('All Dealership')
  end
end