class SessionsSerializer
  def self.logged_in_user(login_user)
        {
      "data": {
        "type": "users",
        "id": "#{login_user.id}",
        "attributes": {
          "email": "#{login_user.email}",
          "api_key": "#{login_user.api_key}"
        }
      }
    }
  end
end