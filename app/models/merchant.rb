class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(limit = 7)
    select("merchants.*, \
      SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .group(:id)
      .order('revenue DESC')
      .limit(limit)
  end
end
