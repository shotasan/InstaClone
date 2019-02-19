class Post < ApplicationRecord
  #mageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
end
