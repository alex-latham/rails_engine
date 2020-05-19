require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can delete a merchant' do
    deleted_merchant = create(:merchant)

    delete api_v1_merchant_path(deleted_merchant)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:id]).to eq(deleted_merchant.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(deleted_merchant.name)
    expect(Merchant.all).to eq([])
  end
end