require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can create an item' do
    merchant = create(:merchant)
    item = build(:item, merchant: merchant)
    item_attributes = item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    post api_v1_items_path, params: item_attributes

    json = JSON.parse(response.body, symbolize_names: true)

    item_attributes.each do |attribute, value|
      expect(json[:data][:attributes][attribute.to_sym]).to eq(value)
    end
  end
end