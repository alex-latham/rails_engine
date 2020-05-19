require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get a merchant' do
    merchant = create(:merchant)

    get api_v1_merchant_path(merchant)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(merchant.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(merchant.name)
  end
end