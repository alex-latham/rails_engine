require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get an item' do
    item = create(:item)
    item_attributes = item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    get api_v1_item_path(item)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(item.id.to_s)

    item_attributes.each do |attribute, value|
      expect(json[:data][:attributes][attribute.to_sym]).to eq(value)
    end
  end
end