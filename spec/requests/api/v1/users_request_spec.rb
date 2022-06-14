require 'rails_helper'

describe "Users API" do
  it "sends a list of details for a forecast", :vcr do
    # create_list(:forecast, 3)

    post '/api/v1/users'

    expect(response).to be_successful
    # expect(response.status).to eq(201)
  end
end