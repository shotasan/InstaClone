class Post < ApplicationRecord
  validates :text, presence: true,length: { maximum: 140 }
  validates :image, presence: true
  #mageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
