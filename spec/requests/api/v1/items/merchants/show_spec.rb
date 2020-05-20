require 'rails_helper'

RSpec.describe 'User' do
  it 'can get the merchant for an item' do
    item = create(:item)

    get api_v1_item_merchant_path(item)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to              eq('merchant')
    expect(json[:data][:id]).to                eq(item.merchant.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(item.merchant.name)
  end
end