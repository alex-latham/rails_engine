require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can delete an item' do
    deleted_item = create(:item)

    delete api_v1_item_path(deleted_item)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to                     eq("item")
    expect(json[:data][:id]).to                       eq(deleted_item.id.to_s)
    expect(json[:data][:attributes][:name]).to        eq(deleted_item.name)
    expect(json[:data][:attributes][:description]).to eq(deleted_item.description)
    expect(json[:data][:attributes][:unit_price]).to  eq(deleted_item.unit_price)
    expect(json[:data][:attributes][:merchant_id]).to eq(deleted_item.merchant_id)
    expect(Item.all.length).to                        eq(0)
  end
end