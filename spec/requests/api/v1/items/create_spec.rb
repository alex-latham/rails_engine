require 'rails_helper'

RSpec.describe 'Visitor', type: :request do
  it 'can create an item' do
    merchant = create(:merchant)
    new_item = build(:item, merchant: merchant)

    post api_v1_items_path, params: new_item.attributes

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to                     eq('item')
    expect(json[:data][:attributes][:name]).to        eq(new_item.name)
    expect(json[:data][:attributes][:description]).to eq(new_item.description)
    expect(json[:data][:attributes][:unit_price]).to  eq(new_item.unit_price)
    expect(json[:data][:attributes][:merchant_id]).to eq(new_item.merchant_id)

    item = Item.last

    expect(item.name).to        eq(new_item.name)
    expect(item.description).to eq(new_item.description)
    expect(item.unit_price).to  eq(new_item.unit_price)
    expect(item.merchant_id).to eq(new_item.merchant_id)
  end
end