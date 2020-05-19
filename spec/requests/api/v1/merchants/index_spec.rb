require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get all merchants' do
    create_list(:merchant, 2)

    get api_v1_merchants_path

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)
    json[:data].each do |merchant|
      expect(merchant[:type]).to eq("merchant")
      expect(merchant[:attributes]).to have_key(:name)
    end
  end
end