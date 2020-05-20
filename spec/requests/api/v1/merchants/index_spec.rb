require 'rails_helper'

RSpec.describe 'Visitor', type: :request do
  it 'can get all merchants' do
    merchants = create_list(:merchant, 2)

    get api_v1_merchants_path

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to eq(2)

    expect(json[:data][0][:type]).to              eq('merchant')
    expect(json[:data][0][:id]).to                eq(merchants[0].id.to_s)
    expect(json[:data][0][:attributes][:name]).to eq(merchants[0].name)

    expect(json[:data][1][:type]).to              eq('merchant')
    expect(json[:data][1][:id]).to                eq(merchants[1].id.to_s)
    expect(json[:data][1][:attributes][:name]).to eq(merchants[1].name)
  end
end