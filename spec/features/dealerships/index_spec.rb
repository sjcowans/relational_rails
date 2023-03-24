require 'rails_helper'

RSpec.describe "dealerships index page", type: :feature do
  it "can see all dealerships titles and play count" do
    dealership_1 = Dealership.create!(name: "Kia",
                                    zip: 79938,
                                    operational: true)
    dealership_2 = Dealership.create!(name: "Jeep",
                                    zip: 79938,
                                    operational: true)
    dealership_3 = Dealership.create!(name: "Chevy",
                                    zip: 79938,
                                    operational: true)
    
    visit "/dealerships"
    
    expect(page).to have_content(dealership_1.name)
    expect(page).to have_content(dealership_1.created_at)
    expect(page).to have_content(dealership_2.name)
    expect(page).to have_content(dealership_2.created_at)
    expect(page).to have_content(dealership_3.name)
    expect(page).to have_content(dealership_3.created_at)
    expect(page).to have_content('New Dealership')
    expect(page).to have_content('Home')
    expect(page).to have_content('Dealership Index')
    expect(page).to have_content('Car Index')
    expect(page).to have_content('All Dealership')
    expect(page).to have_content('Delete Dealership')
  end
end