class User < ApplicationRecord
  attr_accessor :remember_token

  has_secure_password

  def remember
    self.remember_token = User.generate_token
    update_attribute(:remember_digest, User.generate_digest(remember_token))
  end

  def forget
    self.remember_token = nil
    update_attribute(:remember_digest, nil)
  end

  def User.generate_token
    SecureRandom.urlsafe_base64
  end

  def User.generate_digest(token)
    Digest::SHA1.hexdigest(token)
  end
end
