class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  def custom_response
    {
      email: email,
      name: name
    }
  end
end
