require 'rails_helper'

RSpec.describe 'User' do
  it 'can find an item that contains a fragment, case insensitive' do
    item10 = create(:item, name: 'ITEM1.0')
             create(:item, name: 'item1.5')
             create(:item, name: 'item2.0')

    get '/api/v1/items/find?name=Em1.0'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to                     eq('item')
    expect(json[:data][:id]).to                       eq(item10.id.to_s)
    expect(json[:data][:attributes][:name]).to        eq(item10.name)
    expect(json[:data][:attributes][:description]).to eq(item10.description)
    expect(json[:data][:attributes][:unit_price]).to  eq(item10.unit_price)
    expect(json[:data][:attributes][:merchant_id]).to eq(item10.merchant_id)
  end
end