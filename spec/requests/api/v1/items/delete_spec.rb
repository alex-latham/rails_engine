require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can delete an item' do
    deleted_item = create(:item)
    deleted_item_attributes = deleted_item.attributes.slice('name', 'description', 'unit_price', 'merchant_id')

    delete api_v1_item_path(deleted_item)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(deleted_item.id.to_s)

    deleted_item_attributes.each do |attribute, value|
      expect(json[:data][:attributes][attribute.to_sym]).to eq(value)
    end
  end
end