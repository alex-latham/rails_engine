require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can create a merchant' do
    new_merchant = build(:merchant)

    post api_v1_merchants_path, params: {name: new_merchant.name}

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:name]).to eq(new_merchant.name)

    merchant = Merchant.last

    expect(merchant.name).to eq(new_merchant.name)
  end
end