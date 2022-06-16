require 'rails_helper'

describe "Sessions API" do
  it "User can login" do

    user = User.create!(email: "this@that.com", password: "password")

    body = {
      "email" => "this@that.com",
      "password" => "password"
    }
    post '/api/v1/sessions', params: body, as: :json
    user = JSON.parse(response.body, symbolize_names: true)

    expected = {
      "data": {
        "type": "users",
        "id": user[:data][:id],
        "attributes": {
          "email": user[:data][:attributes][:email],
          "api_key": user[:data][:attributes][:api_key]
        }
      }
    }
    #
    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
    expect(response.content_type).to eq('application/json')
    expect(response.status).to eq(200)
  end
end