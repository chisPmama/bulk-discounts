# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause
# this file to always be loaded, without a need to explicitly require it in any
# files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, consider making
# a separate helper file that requires the additional dependencies and performs
# the additional setup, and require it from the spec files that actually need
# it.
#
# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

def test_data
  @merchant1 = create(:merchant, name: "CandyLand")
  @merchant2 = create(:merchant, name: "BeefStickCo")

  @customer1 = create(:customer, first_name: "Winner")
  @customer2 = create(:customer, first_name: "Silver")
  @customer3 = create(:customer, first_name: "Bronze")
  @customer4 = create(:customer, first_name: "Brons-Forth")
  @customer5 = create(:customer, first_name: "Fifty Cent")

  @test_customers = [@customer1, @customer2, @customer3, @customer4, @customer5]
  
  @item1 = create(:item, merchant_id: @merchant1.id)
  @item2 = create(:item, merchant_id: @merchant1.id)
  @item3 = create(:item, merchant_id: @merchant1.id)
  @item4 = create(:item, merchant_id: @merchant2.id)
  @item5 = create(:item, merchant_id: @merchant2.id)
  
  count = 5
  @test_customers.each do |customer|
    invoices = []
    count.times do
      invoices << create(:invoice, customer_id: customer.id)
    end
    invoices = invoices.map{|i| i.id}
    invoices.each{|id| create(:transaction, result: 1, invoice_id: id)}
    invoices.each{|id| create(:invoice_item, item_id: @item1.id, invoice_id: id)}
    count-=1
  end


  @incomplete = create(:invoice, customer_id: @customer5.id, status: 0, created_at: Time.new(2021, 3, 9))
  @incomplete2 = create(:invoice, customer_id: @customer5.id, status: 0, created_at: Time.new(2021, 12, 5))
  @incomplete3 = create(:invoice, customer_id: @customer5.id, status: 0, created_at: Time.new(2021, 2, 4))
  @completed = create(:invoice, customer_id: @customer5.id, status: 1, created_at: Time.new(2021, 2, 4))
  @cancelled = create(:invoice, customer_id: @customer5.id, status: 2, created_at: Time.new(2021, 2, 4))

  @incomplete_results = [@incomplete, @incomplete2, @incomplete3]

  create(:invoice_item, item_id: @item1.id, invoice_id: @incomplete.id, status: 2)
  create(:invoice_item, item_id: @item2.id, invoice_id: @incomplete.id, status: 2)
  create(:invoice_item, item_id: @item3.id, invoice_id: @incomplete.id, status: 1)

  create(:invoice_item, item_id: @item1.id, invoice_id: @incomplete2.id, status: 0)
  create(:invoice_item, item_id: @item2.id, invoice_id: @incomplete2.id, status: 1)
  create(:invoice_item, item_id: @item3.id, invoice_id: @incomplete2.id, status: 0)

  create(:invoice_item, item_id: @item4.id, invoice_id: @incomplete3.id, status: 0)

  @discount20 = @merchant1.bulk_discounts.create(discount: 20, quantity: 12)
  @discount15 = @merchant1.bulk_discounts.create(discount: 15, quantity: 10)
  @discount30 = @merchant1.bulk_discounts.create(discount: 30, quantity: 20)
  @discount30 = @merchant2.bulk_discounts.create(discount: 30, quantity: 20)

end

def test_data_2
  @merchant1 = create(:merchant, name: "Target")

  @customer1 = create(:customer)
  @customer2 = create(:customer)
  @customer3 = create(:customer)

  @item1 = create(:item, name: "hat", description: "cool hat", unit_price: 10, merchant_id: @merchant1.id)
  @item2 = create(:item, name: "straw", description: "it is for drinking", unit_price: 1, merchant_id: @merchant1.id)
  @item3 = create(:item, name: "phone", description: "retro phone", unit_price: 100, merchant_id: @merchant1.id)
  @item4 = create(:item, name: "bike", description: "mountain bike", unit_price: 10000, merchant_id: @merchant1.id)
  @item5 = create(:item, name: "goggles", description: "wear it snowboard", unit_price: 80, merchant_id: @merchant1.id)
  @item6 = create(:item, name: "hairspray", description: "get that hair stiff", unit_price: 8, merchant_id: @merchant1.id)
  @item7 = create(:item, name: "mug", description: "drink tea out of it", unit_price: 5, merchant_id: @merchant1.id)
  @item8 = create(:item, name: "candy", description: "get that sugar up", unit_price: 3, merchant_id: @merchant1.id)
  
  @invoice1 = create(:invoice, status: 1, customer_id: @customer1.id, created_at: Time.new(2023, 1, 1)) #sunday
  @invoice2 = create(:invoice, status: 1, customer_id: @customer2.id, created_at: Time.new(2022, 2, 1)) #Tuesday
  @invoice3 = create(:invoice, status: 1, customer_id: @customer3.id, created_at: Time.new(2021, 3, 1)) #Monday
  
  @invoice_item1 = InvoiceItem.create(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 4, unit_price: 10, status: 2)
  @invoice_item2 = InvoiceItem.create(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 1000, unit_price: 1, status: 2)
  @invoice_item3 = InvoiceItem.create(item_id: @item3.id, invoice_id: @invoice1.id, quantity: 202, unit_price: 100, status: 2)
  @invoice_item4 = InvoiceItem.create(item_id: @item4.id, invoice_id: @invoice1.id, quantity: 2, unit_price: 10000, status: 2)
  @invoice_item6 = InvoiceItem.create(item_id: @item6.id, invoice_id: @invoice1.id, quantity: 4, unit_price: 8, status: 2)
  @invoice_item5 = InvoiceItem.create(item_id: @item7.id, invoice_id: @invoice3.id, quantity: 400, unit_price: 5, status: 2)
  @invoice_item7 = InvoiceItem.create(item_id: @item7.id, invoice_id: @invoice1.id, quantity: 5, unit_price: 5, status: 2)
  @invoice_item8 = InvoiceItem.create(item_id: @item8.id, invoice_id: @invoice1.id, quantity: 40, unit_price: 3, status: 2)
  @invoice_item9 = InvoiceItem.create(item_id: @item8.id, invoice_id: @invoice2.id, quantity: 4, unit_price: 10, status: 2)
  @invoice_item10 = InvoiceItem.create(item_id: @item7.id, invoice_id: @invoice2.id, quantity: 40, unit_price: 5, status: 2)
  @invoice_item11 = InvoiceItem.create(item_id: @item6.id, invoice_id: @invoice2.id, quantity: 3, unit_price: 8, status: 2)
  @invoice_item12 = InvoiceItem.create(item_id: @item5.id, invoice_id: @invoice2.id, quantity: 4, unit_price: 80, status: 2)
  @invoice_item13 = InvoiceItem.create(item_id: @item4.id, invoice_id: @invoice2.id, quantity: 1, unit_price: 10000, status: 2)
  @invoice_item14 = InvoiceItem.create(item_id: @item3.id, invoice_id: @invoice3.id, quantity: 40, unit_price: 100, status: 2)
  @invoice_item15 = InvoiceItem.create(item_id: @item2.id, invoice_id: @invoice2.id, quantity: 4000, unit_price: 1, status: 2)
  @invoice_item16 = InvoiceItem.create(item_id: @item1.id, invoice_id: @invoice3.id, quantity: 400, unit_price: 10, status: 2)

  @transaction1 = create(:transaction, result: 1, invoice_id: @invoice1.id)
  @transaction2 = create(:transaction, result: 1, invoice_id: @invoice2.id)
  @transaction3 = create(:transaction, result: 1, invoice_id: @invoice3.id)
end

def test_data_3
  @merchant1 = create(:merchant, name: "CandyLand")
  @customer0 = Customer.create(first_name: "Angus", last_name: "Turing")
  @invoice0 = @customer0.invoices.create(status: 1)
  @invoice7 = @customer0.invoices.create(status: 1)
  @invoice8 = @customer0.invoices.create(status: 1)

  @item2 = @merchant1.items.create(name: "Bat", description: "Bat", unit_price: 200)
  @item3 = @merchant1.items.create(name: "Cat", description: "Cat", unit_price: 300)
  @item4 = @merchant1.items.create(name: "Rat", description: "Rat", unit_price: 400)
  @item8 = @merchant1.items.create(name: "Zat", description: "Zat", unit_price: 500)

  @transaction0 = @invoice0.transactions.create(credit_card_number: 1234, credit_card_expiration_date: 01/11, result: 1)
  @transaction7 = @invoice0.transactions.create(credit_card_number: 1234, credit_card_expiration_date: 01/11, result: 1)
  @transaction8 = @invoice8.transactions.create(credit_card_number: 1234, credit_card_expiration_date: 01/11, result: 1)

  @ii1 = create(:invoice_item, item: @item2, invoice: @invoice0, status: 0)
  @ii2 = create(:invoice_item, item: @item3, invoice: @invoice0, status: 1)
  @ii3 = create(:invoice_item, item: @item4, invoice: @invoice0, status: 2)
  @ii7 = create(:invoice_item, item: @item3, invoice: @invoice0, status: 2)
  @ii8 = create(:invoice_item, item: @item8, invoice: @invoice8, status: 1)

  @invoice0.update(created_at: '1999-01-01 00:00:00')
  @invoice8.update(created_at: '2008-08-08 00:00:00')
  date = Date.today.strftime('%A, %B %d, %Y')
end

def test_data_joseph
  @merchant1 = Merchant.create!(name: "Merchant 1")
  @merchant2 = Merchant.create!(name: "Merchant 2")
  @merchant3 = Merchant.create!(name: "Merchant 3")
  @merchant4 = Merchant.create!(name: "Merchant 4")
  @merchant5 = Merchant.create!(name: "Merchant 5")
  @merchant6 = Merchant.create!(name: "Merchant 6")
  @merchant7 = Merchant.create!(name: "Merchant 7")

  @customer1 = Customer.create!(first_name: "Joseph", last_name: "Lee")
  @customer2 = Customer.create!(first_name: "Tyler", last_name: "Tran")
  @customer3 = Customer.create!(first_name: "Alex", last_name: "Jones")

  @item1 = create(:item, name: "bike", description: "mountain bike", unit_price: 100000, merchant_id: @merchant1.id)
  @item2 = create(:item, name: "phone", description: "retro phone", unit_price: 10000, merchant_id: @merchant2.id)
  @item3 = create(:item, name: "goggles", description: "wear it snowboard", unit_price: 8000, merchant_id: @merchant3.id)
  @item4 = create(:item, name: "hat", description: "cool hat", unit_price: 1000, merchant_id: @merchant4.id)
  @item5 = create(:item, name: "hairspray", description: "get that hair stiff", unit_price: 800, merchant_id: @merchant5.id)
  @item6 = create(:item, name: "mug", description: "drink tea out of it", unit_price: 500, merchant_id: @merchant6.id)
  @item7 = create(:item, name: "candy", description: "get that sugar up", unit_price: 300, merchant_id: @merchant7.id)
  @item8 = create(:item, name: "straw", description: "it is for drinking", unit_price: 100, merchant_id: @merchant7.id)
  
  @invoice1 = create(:invoice, status: 1, customer_id: @customer1.id, created_at: Time.new(2023, 1, 1)) #sunday
  @invoice2 = create(:invoice, status: 1, customer_id: @customer2.id, created_at: Time.new(2022, 2, 1)) #Tuesday
  @invoice3 = create(:invoice, status: 1, customer_id: @customer3.id, created_at: Time.new(2021, 3, 1)) #Monday
  
  @invoice_item1 = InvoiceItem.create(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 1, unit_price: 100000, status: 2)
  @invoice_item15 = InvoiceItem.create(item_id: @item1.id, invoice_id: @invoice2.id, quantity: 5, unit_price: 100000, status: 2)
  @invoice_item2 = InvoiceItem.create(item_id: @item1.id, invoice_id: @invoice1.id, quantity: 2, unit_price: 100000, status: 2)
  @invoice_item3 = InvoiceItem.create(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 3, unit_price: 10000, status: 2)
  @invoice_item4 = InvoiceItem.create(item_id: @item2.id, invoice_id: @invoice1.id, quantity: 4, unit_price: 10000, status: 2)
  @invoice_item5 = InvoiceItem.create(item_id: @item3.id, invoice_id: @invoice1.id, quantity: 2, unit_price: 8000, status: 2)
  @invoice_item6 = InvoiceItem.create(item_id: @item3.id, invoice_id: @invoice2.id, quantity: 2, unit_price: 8000, status: 2)
  @invoice_item7 = InvoiceItem.create(item_id: @item4.id, invoice_id: @invoice2.id, quantity: 7, unit_price: 1000, status: 2)
  @invoice_item8 = InvoiceItem.create(item_id: @item4.id, invoice_id: @invoice2.id, quantity: 8, unit_price: 1000, status: 2)
  @invoice_item9 = InvoiceItem.create(item_id: @item5.id, invoice_id: @invoice2.id, quantity: 9, unit_price: 700, status: 2)
  @invoice_item10 = InvoiceItem.create(item_id: @item5.id, invoice_id: @invoice3.id, quantity: 10, unit_price: 800, status: 2)
  @invoice_item11 = InvoiceItem.create(item_id: @item6.id, invoice_id: @invoice3.id, quantity: 11, unit_price: 500, status: 2)
  @invoice_item12 = InvoiceItem.create(item_id: @item6.id, invoice_id: @invoice3.id, quantity: 12, unit_price: 500, status: 2)
  @invoice_item13 = InvoiceItem.create(item_id: @item7.id, invoice_id: @invoice3.id, quantity: 13, unit_price: 300, status: 2)
  @invoice_item14 = InvoiceItem.create(item_id: @item7.id, invoice_id: @invoice3.id, quantity: 14, unit_price: 300, status: 2)

  @transaction1 = create(:transaction, result: 1, invoice_id: @invoice1.id)
  @transaction2 = create(:transaction, result: 1, invoice_id: @invoice2.id)
  @transaction3 = create(:transaction, result: 1, invoice_id: @invoice3.id)
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # This allows you to limit a spec run to individual examples or groups
  # you care about by tagging them with `:focus` metadata. When nothing
  # is tagged with `:focus`, all examples get run. RSpec also provides
  # aliases for `it`, `describe`, and `context` that include `:focus`
  # metadata: `fit`, `fdescribe` and `fcontext`, respectively.
  config.filter_run_when_matching :focus

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  # https://relishapp.com/rspec/rspec-core/docs/configuration/zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = "doc"
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end
