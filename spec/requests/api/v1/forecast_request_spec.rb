require 'rails_helper'

describe "Forecast API" do
  it "sends a list of details for a forecast" do
    # create_list(:forecast, 3)

    get '/api/v1/forecast'

    expect(response).to be_successful
  end
end