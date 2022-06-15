require 'rails_helper'

describe "Users API" do
  it "can create a new User", :vcr do
    user = User.create!(email: 'mailto:myto@otymtest.com', password_digest: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    body = {
      "email": 'mailto:myto@otymtest.com',
      "password": 'password',
      "password_confirmation": 'password'
    }
    post '/api/v1/users', headers: headers, params: JSON.generate(body)

    expect(response).to be_successful
    expect(user).to be_a(User)
    # expect(response.content_type).to eq('application/json')
    # expect(response).to have_http_status(:created)
    # expect(response.status).to eq(201)
  end
end