require 'rails_helper'

RSpec.describe 'Visitor', type: :request do
  it 'can update a merchant' do
    merchant = create(:merchant)
    updated_merchant = build(:merchant)

    patch api_v1_merchant_path(merchant), params: updated_merchant.attributes

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to              eq('merchant')
    expect(json[:data][:id]).to                eq(merchant.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(updated_merchant.name)

    merchant.reload

    expect(merchant.name).to eq(updated_merchant.name)
  end
end
