require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can update an item' do
    item = create(:item)
    updated_item = build(:item, merchant: item.merchant)

    patch api_v1_item_path(item), params: updated_item.attributes

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to                     eq("item")
    expect(json[:data][:id]).to                       eq(item.id.to_s)
    expect(json[:data][:attributes][:name]).to        eq(updated_item.name)
    expect(json[:data][:attributes][:description]).to eq(updated_item.description)
    expect(json[:data][:attributes][:unit_price]).to  eq(updated_item.unit_price)
    expect(json[:data][:attributes][:merchant_id]).to eq(updated_item.merchant_id)

    item.reload

    expect(item.name).to eq(updated_item.name)
    expect(item.description).to eq(updated_item.description)
    expect(item.unit_price).to eq(updated_item.unit_price)
    expect(item.merchant_id).to eq(updated_item.merchant_id)
  end
end
