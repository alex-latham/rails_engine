require 'rails_helper'

RSpec.describe Revenue, type: :model do
  describe 'methods' do
    it 'initialize' do
      revenue = Revenue.new

      expect(revenue).to be_a(Revenue)
      expect(revenue.id).to be_nil
      expect(revenue.revenue).to be_nil
    end

    it 'self.between_dates' do
      customer = create(:customer)

      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)

      item1 = create(:item, merchant: merchant3)
      item2 = create(:item, merchant: merchant2)
      item3 = create(:item, merchant: merchant1)
      item4 = create(:item, merchant: merchant3)

      invoice1 = create(:invoice, customer: customer, merchant: merchant3, created_at: '2020-05-02')
      invoice2 = create(:invoice, customer: customer, merchant: merchant2, created_at: '2020-05-02')
      invoice3 = create(:invoice, customer: customer, merchant: merchant1, created_at: '2020-05-02')
      invoice4 = create(:invoice, customer: customer, merchant: merchant3, created_at: '2020-05-02')
      invoice5 = create(:invoice, customer: customer, merchant: merchant2, created_at: '2020-05-03')

      create(:invoice_item, item: item1, quantity: 3, unit_price: 1, invoice: invoice1)
      create(:invoice_item, item: item2, quantity: 1, unit_price: 1, invoice: invoice2)
      create(:invoice_item, item: item1, quantity: 2, unit_price: 1, invoice: invoice4)
      create(:invoice_item, item: item2, quantity: 3, unit_price: 1, invoice: invoice2)
      create(:invoice_item, item: item3, quantity: 1, unit_price: 1, invoice: invoice3)
      create(:invoice_item, item: item1, quantity: 4, unit_price: 1, invoice: invoice4)
      create(:invoice_item, item: item4, quantity: 1, unit_price: 1, invoice: invoice4)
      create(:invoice_item, item: item2, quantity: 2, unit_price: 1, invoice: invoice5)

      create(:transaction, invoice: invoice1, result: 'failed')
      create(:transaction, invoice: invoice2, result: 'success')
      create(:transaction, invoice: invoice3, result: 'success')
      create(:transaction, invoice: invoice4, result: 'success')
      create(:transaction, invoice: invoice5, result: 'success')

      revenue = Revenue.between_dates('2020-05-01', '2020-05-02')

      expect(revenue.revenue).to eq(12)
    end
  end
end
