require 'rails_helper'

RSpec.describe "Visitor", type: :request do
  it 'can get all merchants' do
    merchants = create_list(:merchant, 2)

    get api_v1_merchants_path

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)

    json[:data].each_with_index do |merchant, i|
      expect(merchant[:type]).to              eq("merchant")
      expect(merchant[:id]).to                eq(merchants[i].id.to_s)
      expect(merchant[:attributes][:name]).to eq(merchants[i].name)
    end
  end
end