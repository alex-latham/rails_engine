require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can create an item' do
    merchant = create(:merchant)
    new_item = build(:item, merchant: merchant)
    new_item_attributes = new_item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    post api_v1_items_path, params: new_item_attributes

    json = JSON.parse(response.body, symbolize_names: true)

    new_item_attributes.each do |attribute, value|
      expect(json[:data][:attributes][attribute.to_sym]).to eq(value)
    end

    item = Item.last
    item_attributes = item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    expect(item_attributes).to eq(new_item_attributes)
  end
end