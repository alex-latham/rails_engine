require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get all items' do
    create_list(:item, 2)

    get api_v1_items_path

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)
    json[:data].each do |item|
      expect(item[:type]).to eq("item")
      expect(item[:attributes]).to have_key(:name)
      expect(item[:attributes]).to have_key(:description)
      expect(item[:attributes]).to have_key(:unit_price)
      expect(item[:attributes]).to have_key(:merchant_id)
    end
  end
end