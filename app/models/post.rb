class Post < ApplicationRecord
  #mageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
