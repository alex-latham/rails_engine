require 'rails_helper'

RSpec.describe 'User' do
  it 'can find a list of items that contain a fragment, case insensitive' do
    item10 = create(:item, name: 'ITEM1.0')
    item15 = create(:item, name: 'item1.5')
             create(:item, name: 'item2.0')

    get '/api/v1/items/find_all?name=Item1'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to                        eq(2)

    expect(json[:data][0][:type]).to                     eq('item')
    expect(json[:data][0][:id]).to                       eq(item10.id.to_s)
    expect(json[:data][0][:attributes][:name]).to        eq(item10.name)
    expect(json[:data][0][:attributes][:description]).to eq(item10.description)
    expect(json[:data][0][:attributes][:unit_price]).to  eq(item10.unit_price)
    expect(json[:data][0][:attributes][:merchant_id]).to eq(item10.merchant_id)

    expect(json[:data][1][:type]).to                     eq('item')
    expect(json[:data][1][:id]).to                       eq(item15.id.to_s)
    expect(json[:data][1][:attributes][:name]).to        eq(item15.name)
    expect(json[:data][1][:attributes][:description]).to eq(item15.description)
    expect(json[:data][1][:attributes][:unit_price]).to  eq(item15.unit_price)
    expect(json[:data][1][:attributes][:merchant_id]).to eq(item15.merchant_id)
  end
end