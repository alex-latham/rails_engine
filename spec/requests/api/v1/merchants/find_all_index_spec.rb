require 'rails_helper'

RSpec.describe 'User' do
  it 'can find a list of merchants that contain a fragment, case insensitive' do
    merchant10 = create(:merchant, name: 'MERCHANT1.0')
    merchant15 = create(:merchant, name: 'merchant1.5')
                 create(:merchant, name: 'merchant2.0')

    params = {name: 'Merchant1'}

    get api_v1_merchants_find_all_path(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].length).to                 eq(2)

    expect(json[:data][0][:type]).to              eq('merchant')
    expect(json[:data][0][:id]).to                eq(merchant10.id.to_s)
    expect(json[:data][0][:attributes][:name]).to eq(merchant10.name)

    expect(json[:data][1][:type]).to              eq('merchant')
    expect(json[:data][1][:id]).to                eq(merchant15.id.to_s)
    expect(json[:data][1][:attributes][:name]).to eq(merchant15.name)
  end
end