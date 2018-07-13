class User < ApplicationRecord
  before_save { email.downcase! } #少文字に変換

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  has_secure_password
  #「パスワードのハッシュ化」では元に戻せない (不可逆)  暗号は可逆
  validates :password, presence: true, length: { minimum: 6 }
end
