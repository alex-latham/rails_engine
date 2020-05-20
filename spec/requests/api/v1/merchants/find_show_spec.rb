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
end