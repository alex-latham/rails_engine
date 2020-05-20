require 'rails_helper'

RSpec.describe 'User' do
  it 'can find a merchant that contains a fragment, case insensitive' do
    merchant10 = create(:merchant, name: 'MERCHANT1.0')
                 create(:merchant, name: 'merchant1.5')
                 create(:merchant, name: 'merchant2.0')

    get '/api/v1/merchants/find?name=Ant1.0'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to              eq('merchant')
    expect(json[:data][:id]).to                eq(merchant10.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(merchant10.name)
  end

  it 'can find a list of merchants that contain a fragment, case insensitive' do
    merchant10 = create(:merchant, name: 'MERCHANT1.0')
    merchant15 = create(:merchant, name: 'merchant1.5')
                 create(:merchant, name: 'merchant2.0')

    get '/api/v1/merchants/find_all?name=Merchant1'

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