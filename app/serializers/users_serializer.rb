class UsersSerializer
  def self.serialized_user(registered_user)
        {
      "data": {
        "type": "users",
        "id": "#{registered_user.id}",
        "attributes": {
          "email": "#{registered_user.email}",
          "api_key": "#{registered_user.api_key}"
        }
      }
    }
  end
end