class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence:true, length: { maximum: 255 },
            uniqueness: true,
            # このヘルパーは、withオプションで与えられた正規表現と属性の値がマッチするかどうかをテストすることによってバリデーションを行います。
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # emailを小文字にする処理をコールバックとして検証前に実装
  before_validation { email.downcase! }
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }
  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
end
