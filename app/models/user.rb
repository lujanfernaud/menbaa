class User < ApplicationRecord
  attr_accessor :remember_token

  validates :name,  presence: true, length: { in: 2..50 },
                    uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

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
