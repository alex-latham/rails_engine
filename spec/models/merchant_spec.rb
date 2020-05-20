require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many :invoices }
    it { should have_many :invoice_items }
    it { should have_many :transactions }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'methods' do
    it 'self.most_revenue' do
      customer = create(:customer)

      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)

      item1 = create(:item, merchant: merchant3)
      item2 = create(:item, merchant: merchant2)
      item3 = create(:item, merchant: merchant1)
      item4 = create(:item, merchant: merchant3)

      invoice1 = create(:invoice, customer: customer, merchant: merchant3)
      invoice2 = create(:invoice, customer: customer, merchant: merchant2)
      invoice3 = create(:invoice, customer: customer, merchant: merchant1)
      invoice4 = create(:invoice, customer: customer, merchant: merchant3)
      invoice5 = create(:invoice, customer: customer, merchant: merchant2)

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
      create(:transaction, invoice: invoice1, result: 'success')

      merchants = Merchant.most_revenue(2)

      expect(merchants.length).to eq(2)

      expect(merchants[0].id).to eq(merchant3.id)
      expect(merchants[0].name).to eq(merchant3.name)

      expect(merchants[1].id).to eq(merchant2.id)
      expect(merchants[1].name).to eq(merchant2.name)
    end
  end
end
