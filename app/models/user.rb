class User < ApplicationRecord
  before_save { self.email=email.downcase }
  before_save { self.session_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s) }
 has_secure_password
 validates :userid, presence: true , length: { maximum: 8 }, uniqueness: true
 validates :email, format: { with: /\A[^@]+@[^@]+\z/ }, uniqueness: true
 has_many :notebooks, dependent: :destroy
end
