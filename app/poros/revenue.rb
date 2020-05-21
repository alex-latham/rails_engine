class Revenue
  attr_reader :id, :revenue

  def initialize(revenue = nil)
    @id = nil
    @revenue = revenue
  end

  def self.between_dates(start_date, end_date)
    revenue = Invoice.joins(:invoice_items, :transactions)
                     .merge(Transaction.successful)
                     .where(created_at: date_range(start_date, end_date))
                     .sum('quantity * unit_price')
    new(revenue)
  end

  private

  def self.date_range(start_date, end_date)
    Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day
  end
end
