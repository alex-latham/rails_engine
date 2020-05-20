require 'rails_helper'

RSpec.describe 'User' do
  it 'can get items for a merchant' do
    merchant = create(:merchant)
    items = create_list(:item, 2, merchant: merchant)

    get api_v1_merchant_items_path(merchant)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)

    expect(json[:data][0][:type]).to                     eq('item')
    expect(json[:data][0][:id]).to                       eq(items[0].id.to_s)
    expect(json[:data][0][:attributes][:name]).to        eq(items[0].name)
    expect(json[:data][0][:attributes][:description]).to eq(items[0].description)
    expect(json[:data][0][:attributes][:unit_price]).to  eq(items[0].unit_price)
    expect(json[:data][0][:attributes][:merchant_id]).to eq(items[0].merchant_id)

    expect(json[:data][1][:type]).to                     eq('item')
    expect(json[:data][1][:id]).to                       eq(items[1].id.to_s)
    expect(json[:data][1][:attributes][:name]).to        eq(items[1].name)
    expect(json[:data][1][:attributes][:description]).to eq(items[1].description)
    expect(json[:data][1][:attributes][:unit_price]).to  eq(items[1].unit_price)
    expect(json[:data][1][:attributes][:merchant_id]).to eq(items[1].merchant_id)
  end
end