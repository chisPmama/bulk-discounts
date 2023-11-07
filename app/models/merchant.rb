class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices, through: :items
  has_many :customers, through: :invoices

  validates :name, presence: true
  
  def top_5_customers_from_transactions
    customers.joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .select("customers.*, COUNT(DISTINCT transactions.*) AS num_transactions")
    .group(:id)
    .order(num_transactions: :desc)
    .limit(5)
  end

  def popular_items
    self.items.select('items.id, items.name, invoice_items.unit_price, (SUM(invoice_items.quantity) * invoice_items.unit_price * 0.01) as total_revenue')
    .joins(invoices: :transactions)
    .where(transactions: { result: 1 })
    .group('items.id, items.name, invoice_items.unit_price')
    .order('total_revenue DESC')
    .limit(5)
  end

  def items_ready_to_ship_ordered_oldest_to_newest
    self.items
    .joins(:invoices)
    .select("invoice_items.*", "items.name", "invoices.created_at AS date")
    .where("invoice_items.status = ? OR invoice_items.status = ?", "0", "1")
    .group('invoice_items.id', 'items.name', 'invoices.created_at')
    .order("invoices.created_at asc")
  end
end
