require 'rails_helper'

RSpec.describe 'forecast api' do
  it 'sends a list of forecast', :vcr do
    get "http://localhost:3000/api/v1/forecast?location=philadelphia"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body).to be_a(Hash)
    expect(response_body).to have_key(:data)

    forecasts = response_body[:data]

    expect(forecasts).to be_a(Hash)
    expect(forecasts).to have_key(:id)
    expect(forecasts[:id]).to be(nil)
    expect(forecasts).to have_key(:type)
    expect(forecasts[:type]).to be_a(String)
    expect(forecasts).to have_key(:attributes)
    expect(forecasts[:attributes]).to be_a(Hash)

    expect(forecasts[:attributes]).to have_key(:current_weather)
    expect(forecasts[:attributes][:current_weather]).to be_a(Hash)
    expect(forecasts[:attributes]).to have_key(:daily_weather)
    expect(forecasts[:attributes][:daily_weather]).to be_a(Array)
    expect(forecasts[:attributes]).to have_key(:hourly_weather)
    expect(forecasts[:attributes][:hourly_weather]).to be_a(Array)

    expect(forecasts[:attributes][:current_weather]).to have_key(:datetime)
    expect(forecasts[:attributes][:current_weather][:datetime]).to be_a(String)
    expect(forecasts[:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecasts[:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(forecasts[:attributes][:current_weather]).to have_key(:sunset)
    expect(forecasts[:attributes][:current_weather][:sunset]).to be_a(String)
    expect(forecasts[:attributes][:current_weather]).to have_key(:temp)
    expect(forecasts[:attributes][:current_weather][:temp]).to be_a(Float)
    expect(forecasts[:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecasts[:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecasts[:attributes][:current_weather]).to have_key(:uvi)
    expect(forecasts[:attributes][:current_weather][:uvi]).to be_a(Float)
    expect(forecasts[:attributes][:current_weather]).to have_key(:visibility)
    expect(forecasts[:attributes][:current_weather][:visibility]).to be_a(Integer)
    expect(forecasts[:attributes][:current_weather]).to have_key(:conditions)
    expect(forecasts[:attributes][:current_weather][:conditions]).to be_a(String)
    expect(forecasts[:attributes][:current_weather]).to have_key(:icon)
    expect(forecasts[:attributes][:current_weather][:icon]).to be_a(String)

    forecasts[:attributes][:daily_weather].each do |day|
      expect(day).to have_key(:date)
      expect(day[:date]).to be_a(String)
      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_a(String)
      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_a(String)
      expect(day).to have_key(:max_temp)
      expect(day[:max_temp]).to be_a(Float)
      expect(day).to have_key(:min_temp)
      expect(day[:min_temp]).to be_a(Float)
      expect(day).to have_key(:conditions)
      expect(day[:conditions]).to be_a(String)
      expect(day).to have_key(:icon)
      expect(day[:icon]).to be_a(String)
    end
    forecasts[:attributes][:hourly_weather].each do |hour|
      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)
      expect(hour).to have_key(:temp)
      expect(hour[:temp]).to be_a(Float)
      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)
      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
    end
  end
end