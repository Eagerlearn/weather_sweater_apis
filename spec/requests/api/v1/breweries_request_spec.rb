require 'rails_helper'

RSpec.describe 'breweries api' do
  it 'sends a list of breweries', :vcr do
    get "http://localhost:3000/api/v1/breweries?location=chandler&quantity=10"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to be_a(Hash)
    expect(response_body).to have_key(:data)

    breweries = response_body[:data]

    expect(breweries[:attributes][:breweries].count).to eq(6)

    expect(breweries).to be_a(Hash)
    expect(breweries).to have_key(:id)
    expect(breweries[:id]).to be_a(String)
    expect(breweries).to have_key(:type)
    expect(breweries[:type]).to be_a(String)
    expect(breweries).to have_key(:attributes)

    expect(breweries[:attributes]).to be_a(Hash)
    expect(breweries[:attributes]).to have_key(:destination)
    expect(breweries[:attributes][:destination]).to be_a(String)
    expect(breweries[:attributes]).to have_key(:forecast)
    expect(breweries[:attributes][:forecast]).to be_a(Hash)
    expect(breweries[:attributes]).to have_key(:breweries)
    expect(breweries[:attributes][:breweries]).to be_a(Array)

    expect(breweries[:attributes][:breweries].first).to be_a(Array)

    breweries[:attributes][:breweries].each do |brewery_array|
      expect(brewery_array).to be_a(Array)
      brewery_array.each do |location|
        expect(location).to have_key(:id)
        expect(location[:id]).to be_a(String)
        expect(location).to have_key(:name)
        expect(location[:name]).to be_a(String)
        expect(location).to have_key(:brewery_type)
        expect(location[:brewery_type]).to be_a(String)
      end
    end
  end
end