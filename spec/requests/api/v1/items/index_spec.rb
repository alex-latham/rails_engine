require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get all items' do
    items = create_list(:item, 2)

    get api_v1_items_path

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)

    json[:data].each_with_index do |item, i|
      expect(item[:type]).to                     eq("item")
      expect(item[:id]).to                       eq(items[i].id.to_s)
      expect(item[:attributes][:name]).to        eq(items[i].name)
      expect(item[:attributes][:description]).to eq(items[i].description)
      expect(item[:attributes][:unit_price]).to  eq(items[i].unit_price)
      expect(item[:attributes][:merchant_id]).to eq(items[i].merchant_id)
    end
  end
end