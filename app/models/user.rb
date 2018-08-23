class User < ApplicationRecord
  has_secure_password

  def custom_response
    {
      email: email,
      name: name
    }
  end
end
