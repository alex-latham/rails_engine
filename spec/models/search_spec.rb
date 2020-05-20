require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'methods' do
    it 'self.partial_name' do
      merchant10 = create(:merchant, name: 'MERCHANT1.0')
      merchant15 = create(:merchant, name: 'merchant1.5')
      merchant20 = create(:merchant, name: 'merchant2.0')
      item10 = create(:item, name: 'ITEM1.0')
      item15 = create(:item, name: 'item1.5')
      item20 = create(:item, name: 'item2.0')

      merchant_results = Search.partial_name(Merchant, 'Ant1')
      item_results = Search.partial_name(Item, 'Item1')
      
      expect(merchant_results).to include(merchant10, merchant15)
      expect(item_results).to include(item10, item15)
    end
  end
end
