require 'rails_helper'

RSpec.describe 'User' do
  it 'can find a merchant that contains a fragment, case insensitive' do
    merchant10 = create(:merchant, name: 'merchant1.0')
                 create(:merchant, name: 'merchaNt1.5')
                 create(:merchant, name: 'merchant2.0')

    params = {name: 'T1.0'}

    get api_v1_merchants_find_path(params)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to              eq('merchant')
    expect(json[:data][:id]).to                eq(merchant10.id.to_s)
    expect(json[:data][:attributes][:name]).to eq(merchant10.name)
  end
end