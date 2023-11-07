require "rails_helper"

RSpec.describe "Admin Invoices Index" do
  before(:each) do
    test_data
  end

  ## USER STORY 32
  describe 'Invoice IDs and Individual Links' do
    before :each do
      @testing_invoices = @customer1.invoices.limit(5)
    end

    it 'when visiting the invoice index page, shows all invoice ids in the system' do
      visit "/admin/invoices"
      @testing_invoices.each do |i|
        expect(page).to have_content(i.id)
      end
    end

    it "has a link for each id listed that directs to that invoice show page" do
      visit "/admin/invoices"
      @testing_invoices.each do |i|
        click_link "Invoice ##{i.id}"
        expect(current_path).to eq("/admin/invoices/#{i.id}")
        visit "/admin/invoices"
      end
    end
  end

  ## EXTENSION 1-1
  describe 'Managing Invoice Statuses' do
    before :each do
      @index_invoice_test = @customer1.invoices.first
      @index_invoice_test.update(status: 0)
    end

    it "when visiting the index, can see each invoice status" do
      visit "/admin/invoices"
      within("#update_status-#{@index_invoice_test.id}") do
        expect(page).to have_content("Status: In Progress")
        select "Completed", :from => "status_update"
        click_button "Update Invoice Status"
        expect(current_path).to eq("/admin/invoices")
        expect(page).to have_content("Status: Completed")
      end
    end
  end



end