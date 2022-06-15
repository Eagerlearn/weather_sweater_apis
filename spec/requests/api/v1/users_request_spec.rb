require 'rails_helper'

describe "Users API" do
  it "can create a new User" do

    body = {
      "email" => "non_user@register.com",
      "password" => "password",
      "password_confirmation" => "password"
    }
    post '/api/v1/users', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expected = {
      "data": {
        "type": "users",
        "id": results[:data][:id],
        "attributes": {
          "email": results[:data][:attributes][:email],
          "api_key": results[:data][:attributes][:api_key]
        }
      }
    }
    #
    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)
    expect(response.status).to eq(201)
  end
end