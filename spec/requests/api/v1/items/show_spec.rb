require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get an item' do
    item = create(:item)

    get api_v1_item_path(item)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to                     eq("item")
    expect(json[:data][:id]).to                       eq(item.id.to_s)
    expect(json[:data][:attributes][:name]).to        eq(item.name)
    expect(json[:data][:attributes][:description]).to eq(item.description)
    expect(json[:data][:attributes][:unit_price]).to  eq(item.unit_price)
    expect(json[:data][:attributes][:merchant_id]).to eq(item.merchant_id)
  end
end