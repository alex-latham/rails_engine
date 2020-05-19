require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can update an item' do
    item = create(:item)
    updated_item = build(:item, merchant: item.merchant)
    updated_item_attributes = updated_item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    patch api_v1_item_path(item), params: updated_item_attributes

    json = JSON.parse(response.body, symbolize_names: true)

    updated_item_attributes.each do |attribute, value|
      expect(json[:data][:attributes][attribute.to_sym]).to eq(value)
    end

    item.reload
    item_attributes = item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    expect(item_attributes).to eq(updated_item_attributes)
  end
end
