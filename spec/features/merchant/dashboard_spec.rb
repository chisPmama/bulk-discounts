require "rails_helper"

RSpec.describe "Dashboard" do
  before :each do
    @merchant1 = Merchant.create!(name: "Billy")
    @merchant2 = Merchant.create!(name: "Nathan")
  end
  it "US1: shows the name of the merchant" do
  # 1. Merchant Dashboard
  # As a merchant,
  # When I visit my merchant dashboard (/merchants/:merchant_id/dashboard)
  # Then I see the name of my merchant
  visit "/merchants/#{@merchant1.id}/dashboard"
  expect(page).to have_content(@merchant1.name)
  expect(page).to_not have_content(@merchant2.name)
  end

  it "US2: has a link to merchant items and invoices indexes" do
    # 2. Merchant Dashboard Links
    # As a merchant,
    # When I visit my merchant dashboard (/merchants/:merchant_id/dashboard)
    # Then I see link to my merchant items index (/merchants/:merchant_id/items)
    # And I see a link to my merchant invoices index (/merchants/:merchant_id/invoices)
    visit "/merchants/#{@merchant1.id}/dashboard"
    expect(page).to have_link("Merchant Items")
    expect(page).to have_link("Merchant Invoices")
    # click_link("Merchant Items")
    # expect(current_page).to be("/")
    # expect(page).to have_content("Item1")
    # visit "/merchants/#{@merchant1.id}/dashboard"
    # click_link("Merchant Invoices")
    # expect(current_page).to be("/")
    # expect(page).to have_content("Invoice1")
  end
end